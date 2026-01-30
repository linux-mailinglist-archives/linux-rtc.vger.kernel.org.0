Return-Path: <linux-rtc+bounces-5915-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFdQNlfIfGnaOgIAu9opvQ
	(envelope-from <linux-rtc+bounces-5915-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Jan 2026 16:03:51 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AC013BBDA2
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Jan 2026 16:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0F263007B06
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Jan 2026 15:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CED3203B4;
	Fri, 30 Jan 2026 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f4NeHSWX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6833B256C8D
	for <linux-rtc@vger.kernel.org>; Fri, 30 Jan 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785425; cv=none; b=LlMInTZJM3If+is14yuls7w9zO/cmzalGtv0AA5calqp/9/yOhUVH9WGmbv5hyMrzH5O6VdM0LCyBGENcbXfXsxXPCGATis+cKqDIA6GXXcTCPV7fTS81OzzSR8HtvS7PTmInFyXr3bGHyyNLh+ca7odSeXaw1ISxBl4/Tyw6pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785425; c=relaxed/simple;
	bh=thq0kwrsVjkmoBy4Hq4IMi59MV9M0Mi8MaVexvz33lI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k2K6+O5QysrH99eGH/8wSjmo/mSfB/jKlFOOLSZ+E7DQOZTRYJMETKIE88w0jmt5hdFM+0arZkOMlNsVCkdQ8WK0zDYdolHLjL7gPm188ETcnZDueW8cgAMtqZ98QkXzjSwIoQH22O20n8KLF8aNSAJFISwNkGl2hcEMXhkxwVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f4NeHSWX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso23857095e9.2
        for <linux-rtc@vger.kernel.org>; Fri, 30 Jan 2026 07:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769785423; x=1770390223; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=thq0kwrsVjkmoBy4Hq4IMi59MV9M0Mi8MaVexvz33lI=;
        b=f4NeHSWXYHXu5WL3dnbDkq0uDS5Me0VpbbBlviqZfghnIGj/BarCRgkPQIZumRT2oF
         JOC2rw458jABxzyICV7zy++GMP6ait5KpPfwxkomsuIO0BDFWTqRrNMZ0XzaVCuda8bB
         HYoSjEdDfex/PyjkjlB6N+f8FMI7B+LqyG7t8Jv0+ISOZvwsSFeB1r5zHI9IgWCZISZp
         KYdwS8phifPpwhmKBoS1zya3JBTQ+LRLqH9HCcGzNE+VsGp93IJy8sqc7vkzYNFfr4b+
         NaISCYrRiotXha0MMc5Sg7MenhBMNGkz6bY8ATF+3rbOOT5lBk+kKT1SR7//xwgHnytH
         SzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785423; x=1770390223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thq0kwrsVjkmoBy4Hq4IMi59MV9M0Mi8MaVexvz33lI=;
        b=f+qOfD4UPO18clyr4c8fZgWQB7cv29nxDGFTbmioXMsvbGgZjRUoaGR3tVmu01ScFC
         e33km4YJltw5mUHAGy0kEKbtYnmRqZk70z6ImeNbmvLps5cQHe4howy10djt1iFJyXz/
         MbfDVIbO1kQ+vLTKE4Xy2KguyOUjEOumtEuefibf8Lf5kKhjcKcfP8Ju8HQWz51SFTYu
         zmZKuv6vXIpX6G8Gl2fDvNGw5dukp+bbpaVv0WCfcD6JuNgGEfSJWuTO6Ir1A3HqKqrY
         0/5kdA55s6hFudmsCByvG6Bndrp0vSxqO7SJCKjefJpCe7SpqO7VtiliRFIDGKLYcFbR
         nPAw==
X-Forwarded-Encrypted: i=1; AJvYcCXHf6QI4YcN40K/Og5W5F9mvDve8xlpdJM1tm2fC9Quqt00uazisQOl8NHflC+GQEcg8Tt2dcOlIXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGrQurbptCvM+slt7KGdw8EeKbKYY/daXXySBzpIiFLxToX9g
	r39/mu4rIIt1oDh0OVBjll5I3/Wjfk8ZVhWqtBCJDIvMaCU/J1IKsG9d1usW/y/iHao=
X-Gm-Gg: AZuq6aLwIUKMx0GoD5Sxmg/W03n68axaSmIJGpPRYsZHmEEIu8cHrqU49p1mMEh+nr4
	X8e6TQc3ceiTNPn2QfwC5KWtwzY7oXSb/XMKqNGPl6cq9/2XUuUi7nLsUjNzJGvPVQMH3AK54QA
	CNYp8OduoIMlqqhlNa86kCjuOStBz12SDepahmLOwE7Bq2jbHgKsC6hD37vKWmruwaTjvNRB8HC
	zkkaIE32FxTZnrdmFqnEvsNONH8mSbBgHQpTE9pmuvYNk6QTaEuUqQIP6mUqN7EzLajXXdvddp3
	8ft86U33cQ3fP9cI2K94pKk3nQC56g5crvZo1l1gIbOkvjH+jf1spyRZAcTanAysr0XBF1L+ap9
	w1229buiPzGreQay0aFhLX3cHFwEsotJfhQRvjLbmV8hQtKXh6q2tQ6xIDOXVq/318/3AMJgbNu
	YrWavKqRKfYZQ1KTMiJRnRtO4dK8TD8erMhQi20I1temKnbQKG32W6LA96MSCWaE8CZvWMNpRED
	ltgkSIAmw==
X-Received: by 2002:a05:600c:1c02:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-482db494df7mr41910225e9.24.1769785422746;
        Fri, 30 Jan 2026 07:03:42 -0800 (PST)
Received: from ?IPv6:2a02:3030:667:8639:a801:6b4d:7772:893b? ([2a02:3030:667:8639:a801:6b4d:7772:893b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2e3bf18sm16546345e9.19.2026.01.30.07.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:03:42 -0800 (PST)
Message-ID: <e05ccdce1e82b42e837d104922eec1600cce579d.camel@linaro.org>
Subject: Re: [PATCH 3/3] rtc: optee: simplify OP-TEE context match
From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg
	 <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>, Herbert Xu
	 <herbert@gondor.apana.org.au>, =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?=
	 <clement.leger@bootlin.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Date: Fri, 30 Jan 2026 16:03:37 +0100
In-Reply-To: <202601291605277bc279f4@mail.local>
References: 
	<20260126-optee-simplify-context-match-v1-0-d4104e526cb6@linaro.org>
	 <20260126-optee-simplify-context-match-v1-3-d4104e526cb6@linaro.org>
	 <202601291605277bc279f4@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-5915-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rouven.czerwinski@linaro.org,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: AC013BBDA2
X-Rspamd-Action: no action

SGkgQWxleGFuZHJlLAoKT24gVGh1LCAyMDI2LTAxLTI5IGF0IDE3OjA1ICswMTAwLCBBbGV4YW5k
cmUgQmVsbG9uaSB3cm90ZToKPiBPbiAyNi8wMS8yMDI2IDExOjExOjI2KzAxMDAsIFJvdXZlbiBD
emVyd2luc2tpIHZpYSBCNCBSZWxheSB3cm90ZToKPiA+IEZyb206IFJvdXZlbiBDemVyd2luc2tp
IDxyb3V2ZW4uY3plcndpbnNraUBsaW5hcm8ub3JnPgo+ID4gCj4gPiBTaW1wbGlmeSB0aGUgVEVF
IGltcGxlbWVudG9yIElEIG1hdGNoIGJ5IHJldHVybmluZyB0aGUgYm9vbGVhbgo+ID4gZXhwcmVz
c2lvbiBkaXJlY3RseSBpbnN0ZWFkIG9mIGdvaW5nIHRocm91Z2ggYW4gaWYvZWxzZS4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogUm91dmVuIEN6ZXJ3aW5za2kgPHJvdXZlbi5jemVyd2luc2tpQGxp
bmFyby5vcmc+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9ydGMvcnRjLW9wdGVlLmMgfCA1ICstLS0t
Cj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1vcHRlZS5jIGIvZHJpdmVycy9ydGMv
cnRjLW9wdGVlLmMKPiA+IGluZGV4IDE4NGM2ZDE0MjgwMS4uMmYxOGJlM2RlNjg0IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLW9wdGVlLmMKPiA+ICsrKyBiL2RyaXZlcnMvcnRjL3J0
Yy1vcHRlZS5jCj4gPiBAQCAtNTQxLDEwICs1NDEsNyBAQCBzdGF0aWMgaW50IG9wdGVlX3J0Y19y
ZWFkX2luZm8oc3RydWN0IGRldmljZQo+ID4gKmRldiwgc3RydWN0IHJ0Y19kZXZpY2UgKnJ0YywK
PiA+IMKgCj4gPiDCoHN0YXRpYyBpbnQgb3B0ZWVfY3R4X21hdGNoKHN0cnVjdCB0ZWVfaW9jdGxf
dmVyc2lvbl9kYXRhICp2ZXIsCj4gPiBjb25zdCB2b2lkICpkYXRhKQo+ID4gwqB7Cj4gPiAtCWlm
ICh2ZXItPmltcGxfaWQgPT0gVEVFX0lNUExfSURfT1BURUUpCj4gPiAtCQlyZXR1cm4gMTsKPiA+
IC0JZWxzZQo+ID4gLQkJcmV0dXJuIDA7Cj4gPiArCXJldHVybiAodmVyLT5pbXBsX2lkID09IFRF
RV9JTVBMX0lEX09QVEVFKTsKPiAKPiBJIGd1ZXNzIHRoZSBjb3JyZWN0IHdheSB0byBkbyB0aGlz
IHdvdWxkIGJlOgo+IAo+IHJldHVybiAhISh2ZXItPmltcGxfaWQgPT0gVEVFX0lNUExfSURfT1BU
RUUpOwoKQ291bGQgeW91IGV4cGxhaW4gd2h5PyBJZiBJIHJlYWQgdGhlIHN0YW5kYXJkIGNvcnJl
Y3RseSwgYW4gZXF1YWxpdHkKb3BlcmF0aW9uIGFsd2F5cyBwcm9kdWNlcyBlaXRoZXIgMSBvciAw
LCBzbyB0aGVyZSBzaG91bGQgYmUgbm8gbmVlZCBmb3IKISEgaGVyZSBsaWtlIHRoZXJlIGlzIGZv
ciBiaXQgZmxhZyBjb21wYXJpc29ucywgaS5lLiAhIShmbGFnICYKU09NRV9GTEFHX1NFVCkgdG8g
bm9ybWFsaXplIHRvIDEgb3IgMC4gV29uZGVyaW5nIGlmIEkgYW0gbWlzc2luZwpzb21ldGhpbmcu
Cgo+IEJ1dCBpcyB0aGlzIGNoYW5nZSBhY3R1YWxseSBnZW5lcmF0aW5nIGJldHRlciBjb2RlPwo+
IAo+IEJlZm9yZToKPiAKPiBzdGF0aWMgaW50IG9wdGVlX2N0eF9tYXRjaChzdHJ1Y3QgdGVlX2lv
Y3RsX3ZlcnNpb25fZGF0YSAqdmVyLCBjb25zdAo+IHZvaWQgKmRhdGEpCj4gewo+IMKgwqDCoMKg
wqDCoMKgIGlmICh2ZXItPmltcGxfaWQgPT0gVEVFX0lNUExfSURfT1BURUUpCj4gwqDCoMKgwqDC
oMKgIDA6wqDCoMKgwqDCoMKgIGU1OTAwMDAwwqDCoMKgwqDCoMKgwqAgbGRywqDCoMKgwqAgcjAs
IFtyMF0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDE7Cj4gwqDCoMKg
wqDCoMKgwqAgZWxzZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsK
PiB9Cj4gwqDCoMKgwqDCoMKgIDQ6wqDCoMKgwqDCoMKgIGUyNDAwMDAxwqDCoMKgwqDCoMKgwqAg
c3ViwqDCoMKgwqAgcjAsIHIwLCAjMQo+IMKgwqDCoMKgwqDCoCA4OsKgwqDCoMKgwqDCoCBlMTZm
MGYxMMKgwqDCoMKgwqDCoMKgIGNsesKgwqDCoMKgIHIwLCByMAo+IMKgwqDCoMKgwqDCoCBjOsKg
wqDCoMKgwqDCoCBlMWEwMDJhMMKgwqDCoMKgwqDCoMKgIGxzcsKgwqDCoMKgIHIwLCByMCwgIzUK
PiDCoMKgwqDCoMKgIDEwOsKgwqDCoMKgwqDCoCBlMTJmZmYxZcKgwqDCoMKgwqDCoMKgIGJ4wqDC
oMKgwqDCoCBscgo+IAo+IEFmdGVyOgo+IAo+IHN0YXRpYyBpbnQgb3B0ZWVfY3R4X21hdGNoKHN0
cnVjdCB0ZWVfaW9jdGxfdmVyc2lvbl9kYXRhICp2ZXIsIGNvbnN0Cj4gdm9pZCAqZGF0YSkKPiB7
Cj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuICEhKHZlci0+aW1wbF9pZCA9PSBURUVfSU1QTF9JRF9P
UFRFRSk7Cj4gwqDCoMKgwqDCoMKgIDA6wqDCoMKgwqDCoMKgIGU1OTAwMDAwwqDCoMKgwqDCoMKg
wqAgbGRywqDCoMKgwqAgcjAsIFtyMF0KPiB9Cj4gwqDCoMKgwqDCoMKgIDQ6wqDCoMKgwqDCoMKg
IGUyNDAwMDAxwqDCoMKgwqDCoMKgwqAgc3ViwqDCoMKgwqAgcjAsIHIwLCAjMQo+IMKgwqDCoMKg
wqDCoCA4OsKgwqDCoMKgwqDCoCBlMTZmMGYxMMKgwqDCoMKgwqDCoMKgIGNsesKgwqDCoMKgIHIw
LCByMAo+IMKgwqDCoMKgwqDCoCBjOsKgwqDCoMKgwqDCoCBlMWEwMDJhMMKgwqDCoMKgwqDCoMKg
IGxzcsKgwqDCoMKgIHIwLCByMCwgIzUKPiDCoMKgwqDCoMKgIDEwOsKgwqDCoMKgwqDCoCBlMTJm
ZmYxZcKgwqDCoMKgwqDCoMKgIGJ4wqDCoMKgwqDCoCBscgo+IAo+IEknbSBpbiBmYXZvciBvZiBr
ZWVwaW5nIHRoZSBjdXJyZW50IHZlcnNpb24uCgpJIGxpa2UgdGhlIHNob3J0IHZlcnNpb24gYmV0
dGVyLCBidXQgSSBhbSBhbHNvIG5vdCB2ZXJ5IGF0dGFjaGVkIHRvCmdldHRpbmcgdGhpcyBpbiBh
dCBhbGwsIEknbGwgbGV0IHRoZSBtYWludGFpbmVycyBkZWNpZGUuCgpUaGFua3MgYW5kIGJlc3Qg
cmVnYXJkcywKUm91dmVuCgoK


