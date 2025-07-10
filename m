Return-Path: <linux-rtc+bounces-4447-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5231AFF97E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 08:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E143A5181
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 06:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40802288524;
	Thu, 10 Jul 2025 06:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmqHRrGg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420B2877F6
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 06:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752128009; cv=none; b=gIF4iasIuGuQ7rgcDWwGxuniXTPwgGkuGQ7Hc3IzFL3R633EXhr762gDsCDHav+dHSGpHFtbQ1h/EuC0AIsLR+bCDDvVu+LUM/+t+CVgYZnTOQA22oCO/GbHQsT6cUkLJEKESiQhesCeTJonwtvgZp+mM6Apa/FpEkCnlkP+XxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752128009; c=relaxed/simple;
	bh=qIGl3ofMZN4YGC3+hkJsdrAC35OHZlbE6ayWuOboDj4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Agf6ObQo2g2Q/lMy6a1E/wagJ2v1wjFbhqokRXaO2DLKxAb4HO5GRjmGg9J4/dDoYKdoIRA5+OI7x9wi2v1fDOIdg2VOv8jajbAYORTuUC50fy2ny67PczeT4rLrtRyfe0H9GMlQVvJMlxidqNcTcPpAlyzFE+WTh8Pt9DERWxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmqHRrGg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453634d8609so3092095e9.3
        for <linux-rtc@vger.kernel.org>; Wed, 09 Jul 2025 23:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752128005; x=1752732805; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qIGl3ofMZN4YGC3+hkJsdrAC35OHZlbE6ayWuOboDj4=;
        b=tmqHRrGgF119Ca7LrTG9ZjPOTC1QplpRbxALP32kclNpwJtAi30wUtPNbvlGDSa2s8
         4HivoM5G5GMbDrgZAJGs7FtuRtzphgEkEZ4h7BSbb2vVcL7ptZ/SH+q1xyZpbUK3iWs5
         0f0MxLd1V2v1tqPI6vrd+6NhDaDR1MQSH+psCcozHJLLs2iFCcbA7yB+n78rzuKSirhu
         gGBKPHrs3Kzv2r2KaGuBM2IyK/o22C2ktLLpEgAayainrtVVGNNoZPW1kSEgMk60Tk9M
         55iiBN7om6Vsvp0GA4IYqBPyJNyKgxCXQlBPrLSB7N9k4hl1ZpG23R49fhkdzFm9Ky11
         13nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752128005; x=1752732805;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qIGl3ofMZN4YGC3+hkJsdrAC35OHZlbE6ayWuOboDj4=;
        b=aaJgKuEowi1T8H7h6JhBcXr7LuX4hutDQrSct7RgAtj7I9eWVPkBFPpWTdJ83gH14g
         XKULZlY+BBWBrayX+GV45CXLo/tS3ty4dD/y23sXi13h4Do++UkljaPN+2ADbtZxSmPd
         rmXgm9Ptji5vWSyox/BHekg6nLSgKxFJJg/Jf8vXa5o5W//erDL6Sy8URhhneBzw47uo
         TxgT2n0EPkLjAjW7Bs+4yJyLXoKZ8SxlXuURQ3vHenI5Hj5x9PVXFR5gPBG8Q1igraYa
         +/3M1CZdx7y+HC2WklIQtV1RwTw1CZLsbpAH8P1zDw2t8uoy1unhM0ij+PVL0At0ah65
         dgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUixTeFP2piv3c2TjETXueBbrLplg/vLcu9mQ/hpkB8eBgF+nYsxo6rTYU0WGARsCKt3qFJr6WdLOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvRMKF/l7M/IivLac68gKcEwQFH/ihCBly6/NYNwDowlwlbw/
	BpuyCKb04M6Yei0EQzDjFsSpBEAKQ1Pf6iMttaJqR1PPKjQQ10KeMH6hO4eP0eK/4ME=
X-Gm-Gg: ASbGncuspi0ChEzapXVe8wjmB7KAm3YXPLcoHo52Riw7h8HTiyhxRr7AvbX2x4Ijxxg
	qlqFLzeZymCN4j4Y9FpKXPhNZm7fhSpum2gy+SoebwqMBw+o1bnpRyoV9l9yRy38UtHj1cr8gh/
	nsiqdGAHGvjdk9oDbfHZxNRPWyHkh4W6vbIZz1qQYt0zthqktlhOxWms5kc0LwtXogsLpd4I6XA
	Mhyxfducil2BXpp3CgY4EX4G/8z+UwkkDnqD0kR/sEz8sIfy2aZKJFqPetmW1MNmn8WwmGfyeEQ
	AjdTQNviOWmvAiSGKbteERZzWGzg/uFV06+LQhOz/NCcnqJi+el9/pp/YzXs7AVOnA==
X-Google-Smtp-Source: AGHT+IGiIzBae/Gufxz9lausYNLZM0rhTyqOuwPMyv4+f1cfDIVfKWfit+8EynHpXSbDAsUNoJUfhg==
X-Received: by 2002:a05:600c:3512:b0:453:78f:fa9f with SMTP id 5b1f17b1804b1-454d52fb600mr47227905e9.11.1752128004704;
        Wed, 09 Jul 2025 23:13:24 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1741sm928783f8f.18.2025.07.09.23.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:13:24 -0700 (PDT)
Message-ID: <e653f4b90422ee9ac09c62292dfb7a2af1f897d0.camel@linaro.org>
Subject: Re: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Thu, 10 Jul 2025 07:13:22 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping - can this patch be merged please?

Cheers,
Andre'

