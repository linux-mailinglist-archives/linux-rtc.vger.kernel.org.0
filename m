Return-Path: <linux-rtc+bounces-4668-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75909B218F4
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 01:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 823857A6314
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 23:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99425238174;
	Mon, 11 Aug 2025 23:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWDyZqAu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A32B2581;
	Mon, 11 Aug 2025 23:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754953848; cv=none; b=uTqF9giciuJ+ZK0MZpaSpvfE+K2Thjjk84mHh1yXXsDEjXYUaPW7Wl1sVQJFMsKMmbdiiTYVVUs0u6ltIuJTKEH7Vcj8RMbKBrUyXpDJQHH6wpjItQV+DAoyUPtFYgAwcFbJdSPg1Ll9AiPexc29H2ZIEwsQERzy6NUovTJV1sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754953848; c=relaxed/simple;
	bh=hJhF3vz1ZbMIJpYyVzhoCNKNryELOvUsF6C0wXSQkj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayJthyP80+yV5ODdfovuJWTehsIrBUg27ek8OewVZvLguBHAjs/5spKkioh7lCfuHpzXmVFj1zc7wsEUh8ujPu3x365DxuvHLnSYlAs83KL3gQ73G6YbeBTZlFSpn7El2CPaCAVENk/sEbOsR8Z/V1a7d5Yol/wfrXUzHsruFBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWDyZqAu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76bc61152d8so4166011b3a.2;
        Mon, 11 Aug 2025 16:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754953846; x=1755558646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v2r5LP7p8fx7sMIIvJvK7d+YBWuoiJU3wHXi53/Boo0=;
        b=dWDyZqAuR+R4DB/h5bZGbUyadCiT6BYNioEv7hmj9kNzDxNVk1amHOMFbvV9cE/aSf
         Q63BLiS9OOtXCPAnFD6BL9WZS7zEnwjlfoS6VBVAvvDksTfhYLhrbgC47V7RYK8thqic
         jCNg6OTodmPQkNkiqMNgNTiAZlFy2eWiL7rfydtaqm6YC3mA/oAYQ1RcX+I3HMvet8Fi
         9v5AmVCzRTxRZnDXJztZt4Xc43yc/D3SYI9FJ+CVf1XHT98zBEYAQUHL3hu5DBLi6pr4
         VXaFr/E7h0uUw3e6jwLvN455cWtsG9f0AuqZRRT3lcpU+MInkJbFxU8Sg3/U5ThitK4R
         iCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754953846; x=1755558646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2r5LP7p8fx7sMIIvJvK7d+YBWuoiJU3wHXi53/Boo0=;
        b=TdDgOx8b10qrq5iAcTvhgh62VoKB3b6AOFTo7Wjwh7oF6FdN3bAG1xHlz1svU4EZXi
         TQdAymmYEHs3tV+d6ux/l36dflxqSSQOQMQ4dNVPJRZ74ZylTaIFEXxlYT4qjRLpqqsP
         DN7BnBAMwHK9Eozn5cTZm6hEUKG+lwcYHoRGRGTtBFEdQCi3Ru8/Do/KYQMrKVPRVqzl
         rId2gaYxp+xVwLSsGVwVFvY/fMqugz3FkmdAfoI3SaykYa3oI4ihiC0Lo3EOOn4SrV5P
         LVrGQ3XGZ3m+GX6AzJk7Z+p3ponOcz3O4fbmhNC8RcR3D/uq1rQt7PDyMuC5/4AWeCni
         XIhA==
X-Forwarded-Encrypted: i=1; AJvYcCXv+gl1zNbcvCDphcw9sg6szSDFPSEIBjRP6H3VqCH8FKsURZLO3LJaUGPj4GAnxyY/Jx5kf/8l7SE0@vger.kernel.org, AJvYcCXxmWKacOiqLP3jf8jte8zOQB20Ij5bL4m9vXB0HTGjj51Qcod6DoZcKHYpb1aD0fSr5m9H7H8nLKRLIgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrKwKT+u4RfRWxrhGq6v5UOe5ygH5SSs5ii45fxP0BoY8Y2cig
	i8ZNe5SNlSdKeZ4znOB+ChloAKlY/CH11ad+526hXL5iagLn4VqxmR9z
X-Gm-Gg: ASbGncsmqpHF5uvFsy+AZB0VfbDR68A8tdXz2Wa+um0CmwwfjbKGTPEZdL+o1J2hTmY
	VK0bDZmBWFeen5LGupTt0dutkSDxlw/J6VeU4x/jutbmOmX4DirauQdDVLHFwDAO+6DPXcS6vZ/
	fHATwzoHy+opSkaEUki7S8r9lgfxpgM82V6oHEJAUNfWcM0YmBQvMvkDY6/KKM3G0jbDZ56oS6i
	nm8107afDuNfS557c0GiGCAk8RrtCisMHiJ22I4FVLGISKXA9lHUGQdz3McVLp+PpTbzov7akej
	QHjakhLSyeMY59qEn5Gm2jaUvkdzx1ijg3keRDX7BQSyfCKTBfShrQOUs7QdFKZHwJ4NocX2J99
	J+tvsJbxJJJPjEAY/Lv6HIeE=
X-Google-Smtp-Source: AGHT+IHGq7+wu8pe/YIzW6MTFw2duGEpgbfhIXnVmh4uofRtpy7+R4rKjB7+yphwipnlFSKNdaOsww==
X-Received: by 2002:a05:6a20:7f9a:b0:23d:f987:b033 with SMTP id adf61e73a8af0-2409a9ed674mr2098895637.40.1754953846275;
        Mon, 11 Aug 2025 16:10:46 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7933:7499:67d8:279a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b46f5a69087sm340210a12.62.2025.08.11.16.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 16:10:45 -0700 (PDT)
Date: Mon, 11 Aug 2025 16:10:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Kurz <akurz@blala.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Lee Jones <lee@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-input@vger.kernel.or, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] Drivers: mc13783: remove deprecated mc13xxx_irq_ack()
Message-ID: <qslimcdueyseyki2uon7igq5hwborupastnilmrzrpz2annkfs@qhjxydowdnmw>
References: <20250811064358.1659-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811064358.1659-1-akurz@blala.de>

On Mon, Aug 11, 2025 at 06:43:58AM +0000, Alexander Kurz wrote:
> mc13xxx_irq_ack() got deprecated and became dead code with commit
> 10f9edaeaa30 ("mfd: mc13xxx: Use regmap irq framework for interrupts").
> It should be safe to remove it now.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c |  1 -
>  drivers/input/touchscreen/mc13783_ts.c |  4 ----

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

I assume this will go through MFD?

Thanks.

-- 
Dmitry

