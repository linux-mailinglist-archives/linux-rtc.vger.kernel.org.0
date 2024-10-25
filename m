Return-Path: <linux-rtc+bounces-2333-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734B89B0F89
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2024 22:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F05B284396
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2024 20:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C2F20D51C;
	Fri, 25 Oct 2024 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAToUZuu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A9720C320;
	Fri, 25 Oct 2024 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729886875; cv=none; b=ngVvWuO/9pk6pBh413quBwv8Hctajj/zNluSAitlakp3ngMztKIovR1/u5bUJioUoDDe9NfQOkn5i386CM159AC3m5/s8j9M7Cv8W0ydbKZw3fZA8EKsdZdFu90M6wceJWde5fxCv2/77s4pb2vPEkf5kkII7UZEo5eCE25IqmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729886875; c=relaxed/simple;
	bh=t/T+RWNAPe6H8pnuUQTA0Zy8kIKLXOB0BCKHvNE6EBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6jGLQ0KSn/9j2PZ3wAF23laf0dPHWMye8XH8PZjaZjQr5EcwOUkOjSSIqV/d5opTdqGuDanZzcJT9YdtYL237QQvhZn54b74RtQ85dz/iSBmyVGYrPRhwhj9v6uebA7Aw7QfZGOnKFMmduSGAohMFIsfP+dpdaEcFolTIdWPOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAToUZuu; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so1825180a12.0;
        Fri, 25 Oct 2024 13:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729886873; x=1730491673; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5dbV1tRHLTLsqjiToTOQKfhYKZO1wGgI+G1vKgEe3SY=;
        b=jAToUZuuleCXP86WlGd9jvFbEamv8wCLAClxcnzuCiMpAkSPkmfHnLNwmHGJTaDwpf
         SbUW+TesDoP6B5OaKgdn19yscRI4oTU5hoPtsXGq7+bHZFAnGiN5ShEU2WItgGSzkhPC
         E0+McGmn3jMV+lpWV0WhC5ZRo4HBHjYmsoB9OKRv5XgL0f/u1K6F0WTZsGNOTbcJkVic
         k5oREv4Urbepod4xS7fSUmx6luMpMSfPl+CXFQW7jHPSn4XUqpimYusfi1ihCnTJu+lh
         Fy4MnGTjPnCzQbvu+RTs3S0OFMr+n10uOuCEbM6tvz24JNgS3rUdqD3E7Pr0w1e5fW7+
         bEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729886873; x=1730491673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dbV1tRHLTLsqjiToTOQKfhYKZO1wGgI+G1vKgEe3SY=;
        b=J4X2YabkIsVNVm1PiecxGgF/1yRUY3ahWYu5nvY/l3QACO81dFGTvD7t2Iq4pjdWIF
         0rzh2fh8BHrzvzXEr6346fybDmW7HcCK3s2TSqdiA0BrCDn+dw4ZqY1BZbxK9DuenYJm
         U1VEH35JgX04lGpU+G89eGSWO4wOEIruEzvVWcfu1zg/4qni/969ht60sNGdnpOlcUhd
         c1Ag7hYvzS5FOt15zih1T0LrP2hkztFe3W725ZlPlBVB30q4r9+UpWLKLu27Sfvon9eF
         Gu7pCwwhF4qtBlWXJrvD50jibI2w2s/0kfoAfPSGuVmJrgTKUQFiu81Z3VToOEHxzZjA
         UZqg==
X-Forwarded-Encrypted: i=1; AJvYcCUIE8kM37OdRjhHd9/wQbGS689POun9d7OKLTUnaM1JzROy9eUUd+tMKRaSBb/EhlllQh2wsDTUjsd3@vger.kernel.org, AJvYcCVOJvkU48T9q8kBKG1nVhohHezTJmGcfX+dJNTiw2phaByKlCyA4B8TAXgYOIsPgEAW0JNYDmMv9GDr3R8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5h6G+UZ+ULopAiiXw5QOxEM2o0GpPbqQwO+Cam+sVoqC/7p6f
	p5POe9cJ0L9vVDo82uTpk7gCDAuGte5kqNVDt6lhJ2OPfy1OXNF8
X-Google-Smtp-Source: AGHT+IFdKGls00wotX40vYtE1Br/ohES1FSPg7WRtCJRlvgyoFoUwwV+ohK0Qwdha1zaOh3BfBVm9Q==
X-Received: by 2002:a05:6a20:2d23:b0:1d7:f7d:5ced with SMTP id adf61e73a8af0-1d9a84d1699mr505105637.37.1729886873069;
        Fri, 25 Oct 2024 13:07:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1691:2dbd:7c00:4e03])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc89f442bsm1472123a12.74.2024.10.25.13.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:07:52 -0700 (PDT)
Date: Fri, 25 Oct 2024 13:07:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Joy Chakraborty <joychakr@google.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: avoid taking rtc_lock for extended period of
 time
Message-ID: <Zxv6ltPBWfWs957R@google.com>
References: <Zxqv9KYnBdtnuqox@google.com>
 <B8A0CC86-7C24-4154-B8F3-69CD6B6C94BD@o2.pl>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B8A0CC86-7C24-4154-B8F3-69CD6B6C94BD@o2.pl>

On Fri, Oct 25, 2024 at 08:01:37AM +0200, Mateusz Jończyk wrote:
> Dnia 24 października 2024 22:37:08 CEST, Dmitry Torokhov <dmitry.torokhov@gmail.com> napisał/a:
> >On my device reading entirety of /sys/devices/pnp0/00:03/cmos_nvram0/nvmem
> >takes about 9 msec during which time interrupts are off on the CPU that
> >does the read and the thread that performs the read can not be migrated
> >or preempted by another higher priority thread (RT or not).
> >
> >Allow readers and writers be preempted by taking and releasing rtc_lock
> >spinlock for each individual byte read or written rather than once per
> >read/write request.
> 
> Hello, 
> A nice idea! 
> (sorry for any formatting problems, I'm on a train right now) 
> 
> >
> >Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >---
> > drivers/rtc/rtc-cmos.c | 31 +++++++++++++++----------------
> > 1 file changed, 15 insertions(+), 16 deletions(-)
> >
> >diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> >index 35dca2accbb8..e8f2fe0d8560 100644
> >--- a/drivers/rtc/rtc-cmos.c
> >+++ b/drivers/rtc/rtc-cmos.c
> >@@ -645,18 +645,17 @@ static int cmos_nvram_read(void *priv, unsigned int off, void *val,
> > 	unsigned char *buf = val;
> > 
> > 	off += NVRAM_OFFSET;
> >-	spin_lock_irq(&rtc_lock);
> >-	for (; count; count--, off++) {
> >+	for (; count; count--, off++, buf++) {
> >+		guard(spinlock_irq)(&rtc_lock);
> > 		if (off < 128)
> >-			*buf++ = CMOS_READ(off);
> >+			*buf = CMOS_READ(off);
> > 		else if (can_bank2)
> >-			*buf++ = cmos_read_bank2(off);
> >+			*buf = cmos_read_bank2(off);
> > 		else
> >-			break;
> >+			return -EIO;
> > 	}
> >-	spin_unlock_irq(&rtc_lock);
> > 
> >-	return count ? -EIO : 0;
> >+	return count;
> 
> return 0;

Oh, yes, of course, thank you.

-- 
Dmitry

