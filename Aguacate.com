<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Niño Aguacate · Finca Manantial · Fundación Ecogreen</title>
<style>
  *{margin:0;padding:0;box-sizing:border-box}
  :root{
    --verde:#1a3d2e;--verde2:#2d6a4f;--verde3:#52b788;--verde4:#95d5b2;
    --crema:#f8f4e9;--dorado:#d4a24e;--tierra:#8b5a2b;--texto:#1a1a1a;
  }
  body{font-family:'Georgia',serif;background:var(--crema);color:var(--texto);line-height:1.6;overflow-x:hidden}
  .hero{min-height:100vh;background:linear-gradient(135deg,var(--verde) 0%,var(--verde2) 100%);color:var(--crema);padding:40px 20px;display:flex;flex-direction:column;justify-content:center;align-items:center;text-align:center;position:relative;overflow:hidden}
  .hero::before{content:'';position:absolute;top:-50%;left:-50%;width:200%;height:200%;background:radial-gradient(circle,rgba(212,162,78,0.15) 0%,transparent 60%);animation:pulse 8s infinite}
  @keyframes pulse{0%,100%{transform:scale(1)}50%{transform:scale(1.1)}}
  .hero-content{position:relative;z-index:2;max-width:800px}
  .logo-grande{font-size:clamp(2.5rem,8vw,5rem);font-weight:bold;letter-spacing:2px;margin-bottom:10px;text-shadow:2px 2px 8px rgba(0,0,0,0.3)}
  .logo-grande span{color:var(--dorado)}
  .tagline{font-size:clamp(1rem,2.5vw,1.3rem);font-style:italic;opacity:0.95;margin-bottom:30px}
  .badge-tradicion{display:inline-block;background:var(--dorado);color:var(--verde);padding:10px 20px;border-radius:30px;font-weight:bold;font-size:0.9rem;letter-spacing:1px;margin-bottom:30px}
  .btn-principal{display:inline-block;background:var(--crema);color:var(--verde);padding:18px 40px;border-radius:50px;text-decoration:none;font-weight:bold;font-size:1.1rem;transition:transform 0.3s,box-shadow 0.3s;box-shadow:0 8px 25px rgba(0,0,0,0.2)}
  .btn-principal:hover{transform:translateY(-3px);box-shadow:0 12px 35px rgba(0,0,0,0.3)}
  .stats{display:flex;flex-wrap:wrap;justify-content:center;gap:30px;margin-top:50px;position:relative;z-index:2}
  .stat{text-align:center}
  .stat-num{font-size:2.5rem;font-weight:bold;color:var(--dorado);display:block}
  .stat-label{font-size:0.85rem;opacity:0.9;letter-spacing:1px}
  section{padding:60px 20px;max-width:1100px;margin:0 auto}
  .titulo-seccion{text-align:center;font-size:clamp(1.8rem,4vw,2.5rem);color:var(--verde);margin-bottom:15px;font-weight:bold}
  .subtitulo-seccion{text-align:center;font-style:italic;color:var(--tierra);margin-bottom:40px;font-size:1.1rem}
  .historia{background:white;padding:40px;border-radius:20px;box-shadow:0 4px 20px rgba(0,0,0,0.08);border-left:5px solid var(--dorado)}
  .historia p{margin-bottom:18px;font-size:1.05rem}
  .historia p:last-child{margin-bottom:0}
  .variedades-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:20px;margin-top:30px}
  .variedad-card{background:white;border-radius:20px;padding:28px;box-shadow:0 4px 20px rgba(0,0,0,0.08);border-top:4px solid var(--verde3);transition:transform 0.3s,box-shadow 0.3s;cursor:pointer;position:relative}
  .variedad-card:hover{transform:translateY(-5px);box-shadow:0 12px 30px rgba(0,0,0,0.15)}
  .variedad-card.premium{border-top-color:var(--dorado)}
  .variedad-emoji{font-size:2.5rem;margin-bottom:10px;display:block}
  .variedad-nombre{font-size:1.4rem;color:var(--verde);font-weight:bold;margin-bottom:8px}
  .variedad-desc{font-size:0.95rem;color:#555;margin-bottom:14px}
  .variedad-precio{font-size:1.2rem;color:var(--tierra);font-weight:bold}
  .variedad-precio small{font-size:0.75rem;color:#888;font-weight:normal;display:block}
  .complemento{margin-top:20px;background:linear-gradient(135deg,var(--verde4),var(--verde3));color:var(--verde);padding:20px;border-radius:16px;text-align:center;font-weight:bold}
  .proceso{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:25px;margin-top:30px}
  .paso{background:white;padding:25px;border-radius:16px;box-shadow:0 4px 15px rgba(0,0,0,0.06);position:relative}
  .paso-num{position:absolute;top:-15px;left:20px;background:var(--dorado);color:var(--verde);width:40px;height:40px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-weight:bold;font-size:1.2rem;box-shadow:0 4px 12px rgba(0,0,0,0.15)}
  .paso h3{margin-top:15px;color:var(--verde);font-size:1.15rem;margin-bottom:10px}
  .paso p{font-size:0.95rem;color:#555}
  .pedido{background:linear-gradient(135deg,var(--verde) 0%,var(--verde2) 100%);color:var(--crema);padding:60px 20px;text-align:center;border-radius:0}
  .pedido-container{max-width:800px;margin:0 auto}
  .pedido h2{font-size:clamp(1.8rem,4vw,2.5rem);margin-bottom:20px}
  .pedido p{font-size:1.1rem;margin-bottom:30px;opacity:0.95}
  .form-pedido{background:rgba(255,255,255,0.1);padding:30px;border-radius:20px;backdrop-filter:blur(10px);text-align:left}
  .form-pedido label{display:block;margin-bottom:8px;font-weight:bold;font-size:0.95rem}
  .form-pedido select,.form-pedido input{width:100%;padding:14px;border-radius:10px;border:none;font-size:1rem;margin-bottom:18px;font-family:inherit}
  .checkbox-group{display:flex;align-items:center;gap:10px;margin-bottom:18px}
  .checkbox-group input{width:auto;margin:0}
  .btn-whatsapp{display:block;width:100%;background:#25d366;color:white;padding:18px;border-radius:50px;text-decoration:none;font-weight:bold;font-size:1.15rem;text-align:center;border:none;cursor:pointer;transition:transform 0.3s;box-shadow:0 8px 25px rgba(0,0,0,0.2)}
  .btn-whatsapp:hover{transform:translateY(-3px)}
  .fundacion{background:var(--crema);padding:60px 20px;text-align:center}
  .fundacion-box{max-width:800px;margin:0 auto;background:white;padding:40px;border-radius:20px;box-shadow:0 4px 20px rgba(0,0,0,0.08)}
  .fundacion h2{color:var(--verde);font-size:2rem;margin-bottom:20px}
  .fundacion p{font-size:1.05rem;margin-bottom:15px;color:#444}
  footer{background:var(--verde);color:var(--crema);padding:40px 20px;text-align:center}
  footer a{color:var(--dorado);text-decoration:none}
  .floating-wa{position:fixed;bottom:25px;right:25px;background:#25d366;width:60px;height:60px;border-radius:50%;display:flex;align-items:center;justify-content:center;box-shadow:0 6px 20px rgba(0,0,0,0.3);z-index:100;text-decoration:none;font-size:1.8rem;transition:transform 0.3s}
  .floating-wa:hover{transform:scale(1.1)}
</style>
</head>
<body>

<div class="hero">
  <div class="hero-content">
    <div class="badge-tradicion">🌱 30 AÑOS ORGÁNICO · FINCA MANANTIAL · QUINDÍO</div>
    <h1 class="logo-grande">Niño <span>Aguacate</span></h1>
    <p class="tagline">"El aguacate que tu abuela conocía"</p>
    <a href="#pedido" class="btn-principal">🥑 Hacer un Pedido Ahora</a>
    <div class="stats">
      <div class="stat"><span class="stat-num">30</span><span class="stat-label">AÑOS DE TRADICIÓN</span></div>
      <div class="stat"><span class="stat-num">2</span><span class="stat-label">TONELADAS SEMANALES</span></div>
      <div class="stat"><span class="stat-num">100%</span><span class="stat-label">ORGÁNICO</span></div>
      <div class="stat"><span class="stat-num">∞</span><span class="stat-label">SABOR FAMILIAR</span></div>
    </div>
  </div>
</div>

<section>
  <h2 class="titulo-seccion">La Historia que Nos Une</h2>
  <p class="subtitulo-seccion">Tres décadas sembrando confianza en las montañas del Quindío</p>
  <div class="historia">
    <p>En las laderas de la Finca Manantial, donde la niebla baja al mediodía y el sol calienta la tierra con paciencia, crece algo más que aguacates. Crece una familia. Crece una promesa. Crece una manera de hacer las cosas que casi nadie recuerda.</p>
    <p>Hace treinta años, cuando los vecinos empezaron a usar químicos para producir más rápido, esta familia tomó una decisión que parecía un error: seguir haciendo las cosas a la antigua. Sin veneno. Sin atajos. Sin vender el alma por un quintal más.</p>
    <p>El mercado los llamó locos. Los intermediarios les ofrecieron menos. Los años fueron difíciles. Pero la tierra respondió. Los árboles crecieron fuertes. La fruta salió con un sabor que la gente empezó a recordar — el sabor del aguacate que comían cuando eran niños, antes de que todo supiera igual.</p>
    <p>Hoy, <strong>Niño Aguacate</strong> — ese apodo cariñoso que le puso el pueblo — sigue en la misma finca, con los mismos árboles, con la misma promesa. Y ahora, con la <strong>Fundación Ecogreen</strong>, está aprendiendo a hacer lo que siempre hizo, mejor. Optimizando sin traicionar. Creciendo sin vender el alma.</p>
    <p>Este no es un aguacate más. Es treinta años de una familia que se negó a rendirse. Es la prueba de que lo orgánico no es un lujo — es la única forma de que la montaña siga alimentando al mundo.</p>
  </div>
</section>

<section style="background:white;border-radius:20px;margin:20px auto">
  <h2 class="titulo-seccion">Nuestras Variedades</h2>
  <p class="subtitulo-seccion">Selecciona tu favorita al hacer el pedido</p>
  <div class="variedades-grid">
    <div class="variedad-card" data-var="Papelillo">
      <span class="variedad-emoji">🥑</span>
      <h3 class="variedad-nombre">Papelillo</h3>
      <p class="variedad-desc">La más querida del Quindío. Piel delgada, pulpa cremosa, sabor suave. La que se sirve en las mesas de Armenia.</p>
      <p class="variedad-precio">Precio por kilo <small>Consultar disponibilidad</small></p>
    </div>
    <div class="variedad-card" data-var="Lorena">
      <span class="variedad-emoji">🥑</span>
      <h3 class="variedad-nombre">Lorena</h3>
      <p class="variedad-desc">Originaria de Colombia. Pulpa 87%, sabor suave y mantecoso. Perfecta para untar y para el desayuno.</p>
      <p class="variedad-precio">Precio por kilo <small>Consultar disponibilidad</small></p>
    </div>
    <div class="variedad-card" data-var="Trinidad">
      <span class="variedad-emoji">🥑</span>
      <h3 class="variedad-nombre">Trinidad</h3>
      <p class="variedad-desc">Cruce de tradición y rendimiento. Ovoide, con excelente proporción de pulpa. La favorita de los restaurantes.</p>
      <p class="variedad-precio">Precio por kilo <small>Consultar disponibilidad</small></p>
    </div>
    <div class="variedad-card premium" data-var="Santana">
      <span class="variedad-emoji">👑</span>
      <h3 class="variedad-nombre">Santana Premium</h3>
      <p class="variedad-desc">Originaria de Colombia. Cónica, piel verde brillante. La joya de la finca para los paladares más exigentes.</p>
      <p class="variedad-precio">Precio premium <small>Consultar disponibilidad</small></p>
    </div>
    <div class="variedad-card" data-var="Hass">
      <span class="variedad-emoji">🥑</span>
      <h3 class="variedad-nombre">Hass</h3>
      <p class="variedad-desc">La internacional. Piel gruesa, sabor intenso. Para quienes ya conocen el aguacate y quieren lo mejor de dos mundos.</p>
      <p class="variedad-precio">Precio por kilo <small>Consultar disponibilidad</small></p>
    </div>
    <div class="variedad-card premium" data-var="Combinado">
      <span class="variedad-emoji">🎁</span>
      <h3 class="variedad-nombre">Canasta Combinada</h3>
      <p class="variedad-desc">¿No puedes decidir? Recibe una selección de nuestras mejores variedades de la semana. Sorpréndete.</p>
      <p class="variedad-precio">Precio especial <small>Selección del productor</small></p>
    </div>
  </div>
  <div class="complemento">
    🍌 ¿Agregar plátano orgánico del Quindío a tu pedido? Sí, podemos. Solo dilo en el mensaje.
  </div>
</section>

<section>
  <h2 class="titulo-seccion">Cómo Trabajamos</h2>
  <p class="subtitulo-seccion">El modelo de Fundación Ecogreen en acción</p>
  <div class="proceso">
    <div class="paso">
      <div class="paso-num">1</div>
      <h3>Identificamos</h3>
      <p>Encontramos familias campesinas con tierra, tradición y ganas — pero sin acceso a mercados justos ni tecnología.</p>
    </div>
    <div class="paso">
      <div class="paso-num">2</div>
      <h3>Mejoramos</h3>
      <p>Aportamos tecnología, formación y recursos. La finca produce más, mejor y más limpio. El productor ve resultados.</p>
    </div>
    <div class="paso">
      <div class="paso-num">3</div>
      <h3>Negociamos</h3>
      <p>Solo después de la confianza, proponemos una sociedad: Ecogreen pone la tecnología y el mercado. El productor recibe el 33%.</p>
    </div>
    <div class="paso">
      <div class="paso-num">4</div>
      <h3>Compartimos</h3>
      <p>El 33% va directo al productor. El 67% se reinvierte en expandir el modelo y proteger los corredores biológicos.</p>
    </div>
  </div>
</section>

<div class="pedido" id="pedido">
  <div class="pedido-container">
    <h2>🥑 Haz tu Pedido</h2>
    <p>Personaliza tu pedido y envíalo directo por WhatsApp. Te responderemos en minutos.</p>
    <div class="form-pedido">
      <label for="variedad">Variedad de aguacate:</label>
      <select id="variedad">
        <option value="Papelillo">Papelillo</option>
        <option value="Lorena">Lorena</option>
        <option value="Trinidad">Trinidad</option>
        <option value="Santana Premium">Santana Premium</option>
        <option value="Hass">Hass</option>
        <option value="Canasta Combinada">Canasta Combinada (selección del productor)</option>
      </select>

      <label for="cantidad">Cantidad (kilos):</label>
      <input type="number" id="cantidad" min="1" value="5" placeholder="Ej: 5">

      <div class="checkbox-group">
        <input type="checkbox" id="platano">
        <label for="platano" style="margin:0">🍌 Agregar plátano orgánico del Quindío</label>
      </div>

      <label for="nombre">Tu nombre:</label>
      <input type="text" id="nombre" placeholder="Ej: María González">

      <label for="direccion">Tu dirección o punto de entrega:</label>
      <input type="text" id="direccion" placeholder="Ej: Armenia, barrio La Castellana">

      <label for="notas">Notas adicionales (opcional):</label>
      <input type="text" id="notas" placeholder="Ej: Entregar el viernes en la tarde">

      <a href="#" id="btnEnviar" class="btn-whatsapp">📱 Enviar Pedido por WhatsApp</a>
    </div>
  </div>
</div>

<div class="fundacion">
  <div class="fundacion-box">
    <h2>🌱 Fundación Ecogreen</h2>
    <p>Niño Aguacate es parte de la red de productores orgánicos de <strong>Fundación Ecogreen</strong> — un grupo de jóvenes colombianos que están recuperando las montañas, protegiendo los corredores biológicos, y demostrando que otra forma de producir es posible.</p>
    <p>Cuando compras a Niño Aguacate, no solo recibes el mejor aguacate del Quindío. Estás sosteniendo a una familia campesina, protegiendo un corredor de vida silvestre, y siendo parte de un movimiento que está alimentando al mundo desde las montañas de Colombia.</p>
    <p><strong>TripsToColombia.com</strong> te invita a conocer la finca, caminar los corredores, y ser parte de esta historia.</p>
    <a href="https://quantum-freedom-site.vercel.app/Ayni.html" class="btn-principal" style="margin-top:20px;background:var(--verde);color:var(--crema)">Conoce más de Fundación Ecogreen</a>
  </div>
</div>

<footer>
  <p><strong>Niño Aguacate · Finca Manantial</strong></p>
  <p>Una producción de <a href="#">Fundación Ecogreen</a> · <a href="#">TripsToColombia.com</a></p>
  <p style="margin-top:15px;font-size:0.9rem;opacity:0.8">Las montañas de Colombia alimentan al mundo 🌎</p>
</footer>

<a href="https://wa.me/573236743002" class="floating-wa" target="_blank" rel="noopener">💬</a>

<script>
document.getElementById('btnEnviar').addEventListener('click', function(e){
  e.preventDefault();
  const variedad = document.getElementById('variedad').value;
  const cantidad = document.getElementById('cantidad').value || '5';
  const platano = document.getElementById('platano').checked ? 'Sí ✅' : 'No';
  const nombre = document.getElementById('nombre').value || '[no especificado]';
  const direccion = document.getElementById('direccion').value || '[no especificada]';
  const notas = document.getElementById('notas').value || 'Ninguna';

  const mensaje = `🥑 *NUEVO PEDIDO — NIÑO AGUACATE* 🥑

*Variedad:* ${variedad}
*Cantidad:* ${cantidad} kilos
*¿Agregar plátano?:* ${platano}

*Mi nombre:* ${nombre}
*Mi dirección:* ${direccion}
*Notas:* ${notas}

_Enviado desde la app de Niño Aguacate — Fundación Ecogreen_`;

  const url = `https://wa.me/573236743002?text=${encodeURIComponent(mensaje)}`;
  window.open(url, '_blank');
});

// Pre-llenar variedad al hacer clic en tarjeta
document.querySelectorAll('.variedad-card').forEach(function(card){
  card.addEventListener('click', function(){
    const varName = this.getAttribute('data-var');
    const select = document.getElementById('variedad');
    for(let i=0; i<select.options.length; i++){
      if(select.options[i].value === varName){
        select.selectedIndex = i;
        break;
      }
    }
    document.getElementById('pedido').scrollIntoView({behavior:'smooth'});
  });
});
</script>

</body>
</html>
