Return-Path: <linux-rtc+bounces-1202-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E708C923B
	for <lists+linux-rtc@lfdr.de>; Sat, 18 May 2024 22:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D6A8B20E75
	for <lists+linux-rtc@lfdr.de>; Sat, 18 May 2024 20:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0536B53E32;
	Sat, 18 May 2024 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NxAvRaw6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF6E3B298
	for <linux-rtc@vger.kernel.org>; Sat, 18 May 2024 20:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716064604; cv=none; b=HxRJEHUV1ShUVM9/iA7fmxW609cnbSvGrUasR4yw/A+A2rfLUA7j3yZZu+36/X+TqE5N6xQbGZNfKbeQxvPDsq8sHxxyWJttH1QVxOmnAAJNtze7Cz4wJSxZ+X52leSEyqbdcfMsLAqc2j4SsOGz3gQ1yTSwOPgrA/Ox7GO/XxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716064604; c=relaxed/simple;
	bh=axTlcxEqR5hWie4B2KgVAVfPcFQmVZBZ8j+fzB3XLA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3EmHPNphfwopVZlKfn/ISkxrNfTQYP0zLFMUqqTF8h5d6Y2Rf7h+5WCClLBpI7y6Bq7kdoaH/ANaYqP1MZx4dLCkM0lowsKnTNtdcL/yG+gc2a6p9WKTJfAY8rI+P6yjM7iu+jjm3qh4qPbfrR3K9kj2gkdYYwrfXhBtQL3x7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NxAvRaw6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so42795385ad.1
        for <linux-rtc@vger.kernel.org>; Sat, 18 May 2024 13:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716064603; x=1716669403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYrpYXWxhgivrBCHpRYlsgoARFi6ym7CIXKVYYN00dM=;
        b=NxAvRaw6J4ZcTItRyhOV/WE51I8acFGrx7DkfWw5xb35wQT5zwYDHH/U7jXzYf3HI9
         0Tpx6uDQs30UamL9MW6/xg98UpAkey+4IuGlUc5nJKCQ9aZtVYa5l91L3oJ8eXFy9SWe
         28dcUQK2PyO3jBIMhrHqU5jh2DvybI/bGfWlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716064603; x=1716669403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYrpYXWxhgivrBCHpRYlsgoARFi6ym7CIXKVYYN00dM=;
        b=MmHracO+3qm6A0i8tNp0NDR5u0EAaGb3kLXHIbnM+tKKYz0eSNPIfxglqDyca5VnjY
         2qgZ9SjgvdYs+0VotbTndhYysnk9JgjWAzg9+448a2RcsxIKGadcSqxXqVIdurqfjMPO
         MOxWWrVDBFAC8a1HqQ5LlUVhGF5ZgAeJN8OcsdYqyGTKYfSyMeFq4PrP2PlzZ5KI9nhh
         jzF1kPM8H/3eBOIbDfLvudmSAwaML5bKF7xs1A6U7ry6ChtWnhvjanpbCvVLaJrAbZK0
         ozaClGqeGGY4uizCS+EBFtNtvKk8/km1oJlFdHU6m0icwI8DAyRluNBxdA5Sf0TEY8Ij
         NLSw==
X-Forwarded-Encrypted: i=1; AJvYcCUBgipnWt9VWsnNPS3m8nIFtrzn3/8tuqcJyTf5Hjsp+T5aJvVWUxub9Uc8pc5A/BlMPSwE/G5V7PWKXsxiB9leiiGn2VLXeKk6
X-Gm-Message-State: AOJu0YxGcOQR8t8G62gcLso8ezxq75EYy8ePvjzpVJpn/dzEChkbjtx3
	LCozx+xAoV3bDeFkqTwDjula1bqtFWjvPw3VJZW2BRM0ayEAIqRni/xhOlIbUg==
X-Google-Smtp-Source: AGHT+IEB22jyiK+ER1tYr+UtsGjoCL8OfFoTmIVSUAsFzb1M/rFAkGvWMswdV9f9RPckApvf1uXmcQ==
X-Received: by 2002:a05:6a00:1ac6:b0:6ea:bdbc:614 with SMTP id d2e1a72fcca58-6f4e02b245dmr24104637b3a.13.1716064602761;
        Sat, 18 May 2024 13:36:42 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2aa01dasm17107542b3a.92.2024.05.18.13.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 13:36:42 -0700 (PDT)
Date: Sat, 18 May 2024 13:36:41 -0700
From: Kees Cook <keescook@chromium.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Shuah Khan <shuah@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] selftests: rtc: rtctest: Do not open-code
 TEST_HARNESS_MAIN
Message-ID: <202405181335.00B6D2F@keescook>
References: <20240518001655.work.053-kees@kernel.org>
 <20240518202354d5422c77@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240518202354d5422c77@mail.local>

On Sat, May 18, 2024 at 10:23:54PM +0200, Alexandre Belloni wrote:
> On 17/05/2024 17:16:58-0700, Kees Cook wrote:
> > Argument processing is specific to the test harness code. Any optional
> > information needs to be passed via environment variables. Move alternate
> > path to the RTC_DEV environment variable. Also do not open-code
> > TEST_HARNESS_MAIN because its definition may change.
> 
> Th main issue doing that is that this breaks the main use case of
> rtctest as /dev/rtc1 is usually the main target for those tests. Having
> the RTC_DEV environment variable only documented n this commit message
> is definitively not enough, I'm going to have to handle zillion of
> complaints that this is not working anymore.

Hm, maybe switch the default to /dev/rtc1? Maybe there's a better way to
integrate arguments into a test runner. Right now the core harness code
is doing the argument parsing...

-- 
Kees Cook

