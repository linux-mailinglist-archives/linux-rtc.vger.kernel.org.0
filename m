Return-Path: <linux-rtc+bounces-1404-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9852E9187B6
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Jun 2024 18:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F50D1F24188
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Jun 2024 16:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C059190055;
	Wed, 26 Jun 2024 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFJV3UFH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F525190041;
	Wed, 26 Jun 2024 16:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719420229; cv=none; b=g2phzVKHwPtwMtbuagTi1iNHOxG3xY2OhrBmxD9pBJAveUpUPLFHobnTQGOLfRnpSyRe8UxD6Z9WrJER+hqpI5zJwTlVDW7+ndFKIIw0ckM8Sfclvt723kcGs/CR/4OFpB9MWhgT29C9QPHSjDSptY+xFwQSG2T7m6JEvm4YsDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719420229; c=relaxed/simple;
	bh=VG0CTW/l6QMPvH75w6uUTc8si0UlyREe3hdbA6mVWjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGjT0WPI9Er1Xcrpe7wxRXouPSsNiKhP0lmgEGaquN67jU7CNXFl9YqwlAGqFkfHANyfGj1ugnu1zZP+bXebaVLOwb1qm53Kh8+tKyHPNUCoDieAtfzAE7Um8mTbuV3GJe7drhgA0VMuEqIn0N/3G4tfdQBPsglc6DYsEYZnzIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFJV3UFH; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-631a9d651faso2928207b3.0;
        Wed, 26 Jun 2024 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719420226; x=1720025026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zhrdzthSK3H9hkETy9VZKmUKkeoLCNjPCZYKjf+xG1s=;
        b=gFJV3UFHLuwi7aarOmoQpZ74CXUYll2QPGmkteYGRoLQyTtj9B7qvYKH4AmBWHBW1T
         QOPrg9oD+8NaDQeICtGv9kQDbTG9O0W0ldI7AJvsoT2oO/sADys/NN/ioZOFb94AA1fO
         8Tm5Rcn1VQPaK/ep87Y2Erc1oJAOebC1tm1OV+iTj6dbxtW3VaxYhNBlQirChGw4Mcc8
         hiJGAnoyWNIeYotbeGCLbVCIg4s7rCrDWM+HIsJn9mdeYX3rnaQIvdc+fg1oMMZNrKfJ
         OKdD+FDru+ojm1GOKH9TqKdB6NuFPHjK5jlQQ98Q8fr+BFNTnWrss7Jsfb6yXALqn7D1
         uAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719420226; x=1720025026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhrdzthSK3H9hkETy9VZKmUKkeoLCNjPCZYKjf+xG1s=;
        b=cOQNTJx+4kACnqlL3NyEDNCV3SWH95wK+RXqXpS41q8VlCkKpzid11huo73SaE30Yx
         JZJV4Yqu5OmK9/5ZpiLtSoH6Y7ovtcoZuC4IlCKtCbbbkdVHxAWr4CiiK75BZTWxKfgU
         bvE5DZqbWrWA7UtyoWJefNvMrPH0iMg2uhkqXdsag6XOmgkR9Pjj3SoeMY4QKQVbylgH
         3p8cuRVTC1+Ruw58s4iwjTKS2HGuL57ZVzNbf6ykQK86awD+80ROO6svMrJYwZC5iJQ3
         MjPzyTgxm1/2bndhP4TAAL2XIZXvHE53d4y8Hf59/8ey1Du3NOpZbkHV0JtMlCL5XXg0
         64Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXwpuH9rdWQH8vgpMT94j0v4RYcBWsSkKg8kUJBxs6CFdEPD9lVb7wG6eBbMVyGwCq+tzbiqnifdNsXSl+JxnFFYJ6MZ0jdurita5HtIgyBW+sInbZB/SIZ1q6tFQ4UcuKODEE3STT2Cia6BIvEKOhQK+P82Kfrdol6GcFUfVJV
X-Gm-Message-State: AOJu0YzbGnQHnK8JiSPJwmHX5+Zs/2G2qgAltgG75z2BNLWLxBgd8uuX
	SXZYo7DfNuWVmuuJ5G/xD1jRIiQNpWO3WeGHbxy6hDR2qrrinj6oJ+ydZQ==
X-Google-Smtp-Source: AGHT+IHCdgDSdlNbkbnAcycpINiojpcU5U7poX3MUB5iUjfsCrwkArPk6D/Bh/TNX6YdFEgG7FEJJw==
X-Received: by 2002:a05:690c:63ca:b0:62c:e485:5591 with SMTP id 00721157ae682-64207460d3cmr94060417b3.3.1719420226540;
        Wed, 26 Jun 2024 09:43:46 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f10f8847asm39169167b3.5.2024.06.26.09.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:43:45 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:43:42 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Peter Hilber <peter.hilber@opensynergy.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	"Ridoux, Julien" <ridouxj@amazon.com>, virtio-dev@lists.linux.dev,
	"Luu, Ryan" <rluu@amazon.com>,
	"Christopher S. Hall" <christopher.s.hall@intel.com>,
	Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
Message-ID: <ZnxFPkwGKTdRWTZh@hoboy.vegasvil.org>
References: <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
 <87jzic4sgv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzic4sgv.ffs@tglx>

On Tue, Jun 25, 2024 at 11:34:24PM +0200, Thomas Gleixner wrote:

> There is effort underway to expose PTP clocks to user space via
> VDSO.

That sounds interesting.  Has anything been posted?

Thanks,
Richard


