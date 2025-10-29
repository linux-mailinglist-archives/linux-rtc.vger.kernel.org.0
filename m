Return-Path: <linux-rtc+bounces-5206-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2CAC18816
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 07:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBD68565516
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 06:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A813002A2;
	Wed, 29 Oct 2025 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHGiotsU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FB28003A
	for <linux-rtc@vger.kernel.org>; Wed, 29 Oct 2025 06:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761719563; cv=none; b=saljbnuoAvjqQAul6xvmRx4fwUkTcoMZ8jSzdBB+op/nCy9+LRhWSqmAiGYWcRkNMS9kO66WWdlJt6LfBxSJMWZw2hJwjLY3FAPtvCGxAT+jd6kfuT0jJQXpxuNDataUvN8DoSOkXEvk0jxCzx1+tv84ojTpepiR0zAHwmUtN9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761719563; c=relaxed/simple;
	bh=8fqX1yNSZKPOAEeYYcZLsQwxSr8mhllePdhz+qlw4hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtOpj3E2+iz+ThA637B8G2waQXSypnuxJEkNlMNeiOU92MJfqP1BK0exPiRrdcvDoh6L5aM632vRy4X/WbjN2Fb/tgfqGgNasPEsYYqwdSY8G5zhNBPFPc3e2bmxonp+DIsEYaqpkB7OhP7gY+tDf4kTwzMFQ0pB4PgnYHaPWM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHGiotsU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34029c5beabso1973272a91.1
        for <linux-rtc@vger.kernel.org>; Tue, 28 Oct 2025 23:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761719561; x=1762324361; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8fqX1yNSZKPOAEeYYcZLsQwxSr8mhllePdhz+qlw4hc=;
        b=EHGiotsUp2Abm7ooDXmMwop+Qir+8ydQKxShv4MhnIxUXdq1DxH1gd296PswilMPbP
         CoSI2TzlIqcooeg0IBwB2RSV+aQLcGoofxoBjFVHI7wmakawJF3Z0dWzTl9XaVniDC3z
         P9qlp/fn+gi5u2GMBB8K6WgCdRy1hrxelrTiE3rTahKzEx5o4dDYhzWrU3IpbaN9oJ2c
         e2QM8BIT+HrgKxU75AYMkftALXw/jk9Y3VgzPkl0ihg/vYbrj0QR0IAzTMgQytXMILn8
         tRaWBRNFSZ4WllpbZs+b1xPHbCpu4woDtx4Z3AFzXZev1a3KXGw4sJ3X6nI3Js28PQN9
         T8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761719561; x=1762324361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fqX1yNSZKPOAEeYYcZLsQwxSr8mhllePdhz+qlw4hc=;
        b=sQgHm4gx02iLyDRa8bgdimCIlCoALOCEQOyJmHddA1DsyPG0wKiqQWGBesvtjPALYf
         iS803mUgiTzKf3FqU3TCgF2LerUzSRFGG9xFcmseAvRkm6eyi2BhFeoCuc/Pmm1R1jLD
         1ot6wvGIwjYcCddZkcBpg2f+T+nZg5OfmkMfCfdPJGXuffuUAwVGSOW6kPywd1ZEYBsV
         mut4c885qoT05rg8ROgTsJTdXSN5BWxD3L5gjnMg0Z7EN6ZUCRCEkM5IwRP6JRA1L5/Y
         k1Q3gpeVr1IhfKhvBSiZES2FeTJt8ZDRfD6dx/DLPFt/ZlNllZAbHuw+oRp2JJA3ZYZp
         b/3A==
X-Forwarded-Encrypted: i=1; AJvYcCVPTbWErFKrIWz7PjkuLBX52YSB3bGMRMM4ybPZ6eSjAJDewltAFnwGokIY6WXnC80xD2NLxT+mZpY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgaW1HOWWUUQqLTZxsnNkwozSe6cZC1O4a8bYx4xnJec8KU3np
	fqhoOon8Yl9o2Q5mPU32Qlm5KOf0MNeFreBvTuMCEuDYmD12HzRx8dv+KMu/d4l1GfTAQs52PBR
	bX3b6dj2bXS3GxwDlL0q9lLxsbupCpHE=
X-Gm-Gg: ASbGnct5I5bgjXCQF1v6Ce/WandPhPX2UJC/G54qxMbaTLWYAK/o1IZHJHBzQiHo1jQ
	h4IivxC/55WbZtcoZbzQjT8q7R9JfWpTjXoAeg9IF/NtWubd7sqNukzrdUs3CLtSdzr1/e5ZqFE
	bYfvtJbPukqY4n6Q+pRPojmUCBHrcPmTlCuUD9vt3Th3VZnctJdAQI+aOmY50hTlVW13K9o/bo7
	uESYVC8oAPx9HE5jbGtiTf+uk4P7GaEX+zgrIaUIgL0+i/krCODevjRc5mGDBmgttCdUcKT2g==
X-Google-Smtp-Source: AGHT+IFFVo3TxCbMkZ5UI77sKbgoDsW97wn27M6ulWZD7oeWngePKzAxdda7IduW8N2Ts8l3ViDHxq6u4X6dWfeQ2as=
X-Received: by 2002:a17:90b:586c:b0:339:a323:30fe with SMTP id
 98e67ed59e1d1-3403a15c2eemr2084010a91.14.1761719561334; Tue, 28 Oct 2025
 23:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <b13b733e7e0fba05652f49f727412fed9e0ceb02.1761564043.git.mazziesaccount@gmail.com>
 <20251029-adamant-mamba-of-patience-cddb65@kuoka> <a81fba66-adf0-440f-96e1-bf3a83d504d8@gmail.com>
In-Reply-To: <a81fba66-adf0-440f-96e1-bf3a83d504d8@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Wed, 29 Oct 2025 08:32:30 +0200
X-Gm-Features: AWmQ_bmRIxkt0_0lmeBnGc_3ozd43KhfedH0KHXGki9EADGblZUmvI-2tDAdlfI
Message-ID: <CANhJrGOpH2=h4M5MPM2XwVf0DqfM+5SSvK3Rse7+UaoDyvkUsA@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: Add trickle-charge upper limit
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andreas Kemnade <andreas@kemnade.info>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ke 29.10.2025 klo 8.22 Matti Vaittinen (mazziesaccount@gmail.com) kirjoitti:
>
> On 29/10/2025 08:03, Krzysztof Kozlowski wrote:
> > On Mon, Oct 27, 2025 at 01:45:05PM +0200, Matti Vaittinen wrote:
> >> Some of the chargers for lithium-ion batteries use a trickle-charging as
> >> a first charging phase for very empty batteries, to "wake-up" the battery.
> >
>This is already reflected by existing bindings:
> trickle-charge-current-microamp, Please, see:
> bbcecd1b9335 ("dt-bindings: Add trickle-charge upper limit")
>
Sorry, wrong commit! It should have been the
e3420b49949c ("dt-bindings: battery: add new battery parameters")
as you found out.

(Just a clarification for anyone reading this thread)

