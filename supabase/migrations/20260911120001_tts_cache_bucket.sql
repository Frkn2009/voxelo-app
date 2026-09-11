-- ElevenLabs TTS yanitlarini yeniden kullanmak icin ozel depolama bucket'i.
-- Sabit ders cumleleri (Scenario/Phrase/SpeakTurn) her kullanicida yeniden
-- sentezlenmek yerine ilk uretimden sonra burada saklanir; ayni metin+ses
-- kombinasyonu tekrar istendiginde ElevenLabs'e gidilmez. Bucket ozel
-- (public=false): yalnizca tts Edge Function'i (service role) erisir,
-- istemciye dogrudan bir URL asla donmez.
insert into storage.buckets (id, name, public)
values ('tts-cache', 'tts-cache', false)
on conflict (id) do nothing;
