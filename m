Return-Path: <linux-rtc+bounces-1280-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 370E4904AA0
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 07:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4722B217F1
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 05:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7192237707;
	Wed, 12 Jun 2024 05:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8NhMmNj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034D2376E6;
	Wed, 12 Jun 2024 05:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718168804; cv=none; b=nvgh0zRHrhs5Id2Q7df4s8eHa5O8umrTO2mGUBW+YlMM9NUzX169iwhvhFUXg5hq0x2Slf6F4qGJzq59UdSDmEj/mvWbFGqZR0q48KFCmPnENPJKmVxpvMQ7nHIZlOeFsewka6Gkh0X8EGHqmDgg+iulAo8BUVf44pFK5hV0qtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718168804; c=relaxed/simple;
	bh=CXtcUMWwJkEIqpnRMKcKS4gCggMkOvjE0n81czXvH1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBY7jf0HiNQFerSdsLAC8xzfRBIHhHvB8jUJIXfvBp98zvdDxW6fVXTj5oXQhzDHF+hBNGMd6H86HN0CPUhsdCQpsee7wTAsxoVgbCdFkNOJn1jR7H70pFECtvRX8TUWvaraRsyGYP6Z6J+Rk5HayQV5P5ZQ53JtNM3/SsY3cO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8NhMmNj; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5bb10cfe7daso231244eaf.2;
        Tue, 11 Jun 2024 22:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718168802; x=1718773602; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dXYS15oeWjHskZX8YaOnpu7b/X3OJH0Z2xci2rbkY4=;
        b=C8NhMmNjmI4/N3t94ZQsE/WYakCdRiul4Fbm3KbGOf1DkrOAuCyX7XBd7X0NLpdozu
         N83/haWA8sQu37duWihntw6Er0gGDXGMZxXxbqpLH48qXqqm0jlnXkyhVYpK460f0oZT
         NJF7rFBmbALEPvGEMvt6A1vphy8nONgvBvHvqGwOdP3m/aDYz2LJx1RXdsDcAn3Kg/2E
         HX/DmsbiEtBFOYm5o0IF24Bcl0az+D3CVasrtrjpLtuidVslS9PrXpTAltdZbZ0nSWHy
         TBE4MYlbG07zcdZqCj0L4tSakcR1KB+egW++U70YQOjTuscHP+OuhEifHTf32Q6hqIAJ
         KsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718168802; x=1718773602;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dXYS15oeWjHskZX8YaOnpu7b/X3OJH0Z2xci2rbkY4=;
        b=Xg8v0IWGe2dQSGQ6rnJy6+et7fNvQt0MaMs8ao/wz+9BW3sVYFn5QMcCJgpjQym/5R
         A33cUT5aTu7nSt+OYwRXvA9Ng3u3WUi6lT2XgNM+KZdRGG10nMpCqYT7KGeNse5opGWw
         eZHJq7lzTdA9jNlE97fCcvKn1qWMEqO6iF0CKrYnbgNoj9nmAU6g0P9cKcaEGbzsh7zB
         D9KZvMXZIWr1VSUNQPVjLSxQH8DDBBE9iwOokrBprRJ5l1rnYroQI+ZURU1SpJ2osxIR
         +JiLLmIqujzw4E6pOLs6oVBmCxQR+n5PzSlerZQCWjy89ZcP/FFjRlPZFNMWi2alA+8K
         t1XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPn3/A/zLbFtNFjchQk18pW+8L0RRWior28iu9BUaq2z3SyM4DKIO5NjEYoAF5+54Aqaf5fKiPlLySCsd6hSZBhe4tmr9ddGX4DEoN
X-Gm-Message-State: AOJu0Yx6dyIGxI+14w26NgaGzNebXEaaFjobL5pG35xac9QiDW6kbP1f
	MEtOloGcv7In+N4I+eAOWE+L1NlwzDYk2iIBn5JSljnCIpFU3Cw7
X-Google-Smtp-Source: AGHT+IEgHkA1mSW5y3Jnsg39tt8JnGXbUkGlJIsltSfOEkfg4Nvkb9kRlwfnjq2i674ZZeRgJ2xYnQ==
X-Received: by 2002:a4a:8552:0:b0:5ba:ca86:a025 with SMTP id 006d021491bc7-5bb3b7a9135mr944467eaf.0.1718168801852;
        Tue, 11 Jun 2024 22:06:41 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bac95e0733sm1621549eaf.7.2024.06.11.22.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:06:41 -0700 (PDT)
Date: Tue, 11 Jun 2024 22:06:39 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Szentendrei=2C_Tam=E1s?= <szentendrei.tamas@prolan.hu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miroslav Lichvar <mlichvar@redhat.com>
Subject: Re: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds
 Interrupt
Message-ID: <Zmks31shpsnoLQ3k@hoboy.vegasvil.org>
References: <20240611150458.684349-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611150458.684349-1-csokas.bence@prolan.hu>


(adding Miroslav onto CC)

On Tue, Jun 11, 2024 at 05:04:57PM +0200, Csókás, Bence wrote:

> PCF2127/29/31 is capable of generating an interrupt on every
> second (SI) or minute (MI) change. It signals this through
> the Minute/Second Flag (MSF) as well, which needs to be cleared.

This is a RFC, and my comment is that a PPS from an RTC is not useful
to the Linux kernel.

The kernel only uses the RTC to boot strap the wall clock to some
approximate phase.

After that, Linux either continues with a free running clock, or it
synchronizes to a global time source via NTP.  In the latter case,
Linux will write the NTP time back into the RTC.

So I can't see how the RTC's PPS provides any benefit.

Thanks,
Richard

