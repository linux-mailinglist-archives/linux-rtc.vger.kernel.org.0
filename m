Return-Path: <linux-rtc+bounces-4017-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CF5A9F854
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 20:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D95461882EE1
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 18:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A113A293476;
	Mon, 28 Apr 2025 18:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JdFXuMHC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF426AA8C
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 18:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745864251; cv=none; b=fUx2Jrc9V5g98qOr4VWiwCgDiCFTb9neyp69cYfp9oVoBJSuQOiiWooH0Vk8UOkRqfTzLQXsygVbkuOdj47htOD954Vsu3JSmdDhzGNHU0h7aAArEl8vQVAOQkjyoMWF/pdfzrLS4F5HtVOsC0QUY2gpbbpVilyel+z0sgNHPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745864251; c=relaxed/simple;
	bh=ihGPBiIAT0ONS82KUfYaHLC1u5yTJJn+nPz0lvfjuhM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m5ejMePPUOSHReZ6Yd374mgah9YKkhAaXDKTuxq8oJTZG/2RQN3vc4FmX1fNNbNZOUxOPQXdplrtCJZUZaarsdqju7ukxYEpa00atIfMLAKT86OkegvVtqQ59rpzGwA3zBp0iGjSQb61/kF4opJf6JQ03CsL9b59XZL0gT1+83U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JdFXuMHC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3945041f8f.2
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 11:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745864248; x=1746469048; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ihGPBiIAT0ONS82KUfYaHLC1u5yTJJn+nPz0lvfjuhM=;
        b=JdFXuMHCU1DfzzNlVbXseTflawSNktC+c3O+DAd3A6fNw5qiG3rUXBGxiivKGsdFRX
         +mJvKKr8yJis1EEC6XTs8GRlV5CW6ptjR7W3pa6KsXbGRhHfoMPnqLY1xFNG2f16a/ik
         JehXBwILuNkJG91COcWhoEKjnsyXCL8wzZLpes9tRblhttTzoxeAcpujMLL4LLA5VwDP
         BMj4+hOP+9roV3fy0lqRs6kgZbk+vKhsJQjFPxejQdrZU8h5pPb3hkRtAuVP7aTWTfKH
         c2HmClC1g9AR0HxfiwbQv6xOcjuXSAJRNROOvH9ud7YrwF7zXQdt6QoEVDmr1vcdgyu2
         n2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745864248; x=1746469048;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihGPBiIAT0ONS82KUfYaHLC1u5yTJJn+nPz0lvfjuhM=;
        b=Eijbp0z4rUy6vsf97AFDBGkIDpFAsifMOPOT9CoaTbPEtSicAkJSpYu8OKJtNGc8F1
         cSd1fE1ddJKBxnCuJuvLarAY57PX8Xb84tyiDV8pD8RsZdAbH+8pT8BKNSzEyT5iaIjL
         A57fTZs7P9FtF+g5pE1fhgI8GPCwaNo0/BNrnBHNaT2fF+PEnFa3sCx68of26eYvN/Lt
         SXojlw+C+qW3SDCV03E/ePs4z44lgEjHLHXNnKEtoll+4bKdma8NawGRjZN9XKAEN608
         z2yE8xR5b6293GRJR9KT3WRZrPkAxGKsI4d6qYVRtm/830qhfpa1J5gwPukRdtgntsAX
         GuKg==
X-Forwarded-Encrypted: i=1; AJvYcCVbLyhXuoglDg9lWCMGTkzx8F7CrMDF8Xd41sqMm5vGekBamLD1531g6wuZSXuqVuHx+9NXzFyW8HQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIc9Yg6GPjqnnsJ5ZNRHtEte9lR/eRbNOsWcrdtanCwSohHW4r
	9RKO0sJ2BIOsYtJ26WVzgyG4g/xzFxP7dwIOErNYDyGRRE4HJLIlFFMjueJzEyg=
X-Gm-Gg: ASbGnctIbziYINEYe49GpI8TCDaWtUcvsNRP4EeovjpKlttPNKDAVEMStImk6bZ4HHf
	ZGuLTY/t1S5S5KCPB1VE7Qz3dpqsAv7NRRpwEbIIziIWe4rMGU4SSEZMaKS0/R2A/WvJxnQzsRS
	IDEosto1TVKD2uQ3muBEZ5AxyYkW9ksFcSrDvg9g2N90k4SLglX5Vu1NJASdiDG+lCTSbrnt8OB
	AgVevB1L63HwsN48U0hQGhhVXTWEV4/YL3Vy89PMSUZo2ADeIk5EXVLBl/Yz9kokPXpGTT/G4qI
	vpUNgCEF3FX4uUw+/oFwRr1CFugzvcEG0rjJIRnxElSAyaPtECSExac=
X-Google-Smtp-Source: AGHT+IFizjQdKkSD/fIMemBtF85cPFPzy/Yw/Dq5QRP9W6htVYIl18G4A6sBNzjsAqVDMr/gP96C0g==
X-Received: by 2002:a05:6000:250e:b0:391:3157:7717 with SMTP id ffacd0b85a97d-3a08a371630mr250630f8f.34.1745864247691;
        Mon, 28 Apr 2025 11:17:27 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca497esm11718402f8f.24.2025.04.28.11.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:17:27 -0700 (PDT)
Message-ID: <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones
	 <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus	 <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 28 Apr 2025 19:17:25 +0100
In-Reply-To: <2025041715425693974c6d@mail.local>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250415160212.GA372032@google.com> <2025041715425693974c6d@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3-2+build1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgQWxleGFuZHJlLAoKT24gVGh1LCAyMDI1LTA0LTE3IGF0IDE3OjQyICswMjAwLCBBbGV4YW5k
cmUgQmVsbG9uaSB3cm90ZToKPiBPbiAxNS8wNC8yMDI1IDE3OjAyOjEyKzAxMDAsIExlZSBKb25l
cyB3cm90ZToKPiA+ID4gwqBkcml2ZXJzL21mZC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDM1ICstCj4gPiA+
IMKgZHJpdmVycy9tZmQvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArLQo+ID4gPiDCoGRyaXZlcnMvbWZk
L3NlYy1hY3BtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDQ0MiArKysrKysrKysrKysrKysrKysrCj4gPiA+IMKgZHJpdmVycy9tZmQv
c2VjLWNvbW1vbi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDMwMSArKysrKysrKysrKysrCj4gPiA+IMKgZHJpdmVycy9tZmQvc2VjLWNvcmUu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgNDgxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1jb3Jl
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMjMgKwo+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1pMmMuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMzkgKysrKysrKysr
Kwo+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1pcnEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0NjAgKysrKysrKy0tLS0tLS0tLS0t
LS0KPiA+IAo+ID4gPiDCoGRyaXZlcnMvcnRjL3J0Yy1zNW0uY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOTcgKysrKysrLS0tCj4g
PiAKPiA+IE1GRCBwYXJ0cyBsb29rIG9rYXkgdG8gbWUgbm93Lgo+ID4gCj4gPiBXaXRoIEFja3Mg
ZnJvbSB0aGUgQ2xrIGFuZCBSVEMgbWFpbnRhaW5lcnMsIEkgY2FuIG1lcmdlIGFsbCBvZiB0aGUK
PiA+IGRyaXZlciBzdHVmZiB0b2dldGhlciBhbmQgc3VibWl0IGEgUFIgZm9yIG90aGVycyB0byBw
dWxsIGZyb20uCj4gPiAKPiAKPiBJIGRvbid0IHRoaW5rIHRoZSBSVEMgcGFydCBkZXBlbmRzIG9u
IHRoZSBNRkQgb25lIHNvIEkgd2FzIGdvaW5nIHRvCj4gYXBwbHkgdGhlIHBhdGNoZXMgaW4gbXkg
dHJlZSBpZiB0aGlzIGlzIGZpbmUgZm9yIGV2ZXJ5b25lLgoKUlRDIHBhdGNoIDI3IGRvZXMgZGVw
ZW5kIG9uIHRoZSBzMm1wZzEwIG1mZCBjb3JlIGRyaXZlciAoZHVlIHRvCnVzaW5nIGVudW1zIGFu
ZCBtYWNyb3MgaW50cm9kdWNlZCB0aGVyZSkuCgpQYXRjaGVzIDI1LiAyNiwgMjgsIDI5LCAzMCwg
MzEgaW5kZWVkIGRvbid0IHN0cmljdGx5IGRlcGVuZCBvbiB0aGUKTUZEIGNoYW5nZXMuIFdpdGhv
dXQgcGF0Y2ggMjcgaW4gcGxhY2UsIHBhdGNoZXMgMjUgJiAyNSB3aWxsCmRlZmluaXRlbHkgc3Rp
bGwgYXBwbHksIGFuZCBwYXRjaGVzIDI4Kysgd2lsbCBwcm9iYWJseSBhcHBseS4KCklmIHlvdSB3
YW50IHRvIHRha2UgdGhlbSwgSSBjYW4gdGhlbiByZWJhc2UgdGhpcyBzZXJpZXMgaWYgeW91IHRo
aW5rCnRoYXQncyBiZXR0ZXIuCgpJJ2xsIGRvIHdoYXRldmVyIGlzIHByZWZlcnJlZCwganVzdCBs
ZXQgbWUga25vdyA6LSkKCgpDaGVlcnMsCkFuZHJlJwoK


