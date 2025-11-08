import indexHTML from '../public/index.html';
import adminHTML from '../public/admin.html';

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    
    const corsHeaders = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    };

    if (request.method === 'OPTIONS') {
      return new Response(null, { headers: corsHeaders });
    }

    // Routes
    if (url.pathname === '/') {
      return new Response(indexHTML, {
        headers: { 'Content-Type': 'text/html' }
      });
    }

    if (url.pathname === '/admin') {
      return new Response(adminHTML, {
        headers: { 'Content-Type': 'text/html' }
      });
    }

    // API: Get exams
    if (url.pathname === '/api/exams' && request.method === 'GET') {
      const exams = await env.EXAM_DATA.get('exams', 'json') || [];
      return new Response(JSON.stringify(exams), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      });
    }

    // API: Save exams
    if (url.pathname === '/api/exams' && request.method === 'POST') {
      const auth = request.headers.get('Authorization');
      if (!checkAuth(auth, env.ADMIN_PASSWORD)) {
        return new Response('Unauthorized', { status: 401, headers: corsHeaders });
      }

      const exams = await request.json();
      await env.EXAM_DATA.put('exams', JSON.stringify(exams));
      return new Response(JSON.stringify({ success: true }), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      });
    }

    // API: Get config
    if (url.pathname === '/api/config' && request.method === 'GET') {
      const config = await env.EXAM_DATA.get('config', 'json') || {
        title: 'Exam Tracker',
        description: 'Track your examination progress'
      };
      return new Response(JSON.stringify(config), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      });
    }

    // API: Save config
    if (url.pathname === '/api/config' && request.method === 'POST') {
      const auth = request.headers.get('Authorization');
      if (!checkAuth(auth, env.ADMIN_PASSWORD)) {
        return new Response('Unauthorized', { status: 401, headers: corsHeaders });
      }

      const config = await request.json();
      await env.EXAM_DATA.put('config', JSON.stringify(config));
      return new Response(JSON.stringify({ success: true }), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      });
    }

    return new Response('Not Found', { status: 404 });
  }
};

function checkAuth(authHeader, password) {
  if (!authHeader) return false;
  const provided = authHeader.replace('Bearer ', '');
  return provided === password;
}
