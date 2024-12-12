Return-Path: <linux-rtc+bounces-2728-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE449EE6F6
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 13:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98674165891
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 12:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226622135AC;
	Thu, 12 Dec 2024 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rs5OtR5h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D02208984
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734007437; cv=none; b=tASfxcqfvY92+BVuePaY7f6AuaZ51+ZaqUgb0XdsOZt4YSInWEwgISTYoXFghEXjdFwKOG6XBzoOSWiS/LcXFyMOFNGJexW7Y4UScosTySyAuSE54EiRRPHv+gee/azmbSian7unOP9GjWB6PcuwWM+GITrDGMMUCm/NKq5KIks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734007437; c=relaxed/simple;
	bh=HsqpkaRzcQKBpzweZVnZlBgRFSTi9fQLy7lQTyuByqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mcyyu103Yj2EKS/DhpGHffloQNyHs/Vm8YQ3tiRXR+DnRt/5Sb8PSGAy02kUW+lPy22OQLxLWKEygsGK5osHdEzQgbu5llqDmIYEIHgO2DeD7nf9xg5kbCTygvMSLhOhtn+djcgiheqTUs+ufqYxSbUkvNB/LAYIJEIp7OHCzPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rs5OtR5h; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fd526d4d9eso517884a12.2
        for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 04:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734007435; x=1734612235; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NkAKp596hXmXujT7qh+1ulFEStmdnoQ8RfvCpVWkY0I=;
        b=Rs5OtR5hV1cHK/FSv3/JUFBwAYTJCAW8rV9zqNqFZJOGc5Jb5XhyFBeefbpuBkrzpW
         Edf4vyq49yibbcMGAe8GcZ6oZP15h8N0RN8SORSV/0QDGTixyI+wQl3EYTl7/Rjkpo5k
         J2WjrTWZ69eepz7ndszp04Ale1YbfHDjdFzBq0/KkvpvU/1Z43eX5z3Spio7YuJ4p3L9
         q6xr1TSoaC0SGDBM2UrViIJn9+6hRb24Kaoiqtme/b5vMJvlra/JnLwBHEZ5Gp3JSvG4
         5oYUW295GvnJgzxkBVUamzVOaM8BQr3UGeu88qenNIQj+/W5xTXOTq6sUu9YWzQooP+F
         otWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007435; x=1734612235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkAKp596hXmXujT7qh+1ulFEStmdnoQ8RfvCpVWkY0I=;
        b=eOdZUB2zCiDW3A6kv5Dt/AV51bxOTLMCd6rp3i7pp6r+gjG5kze9O87NHtL87hbT1L
         LGVnvfqPjrBJQi/+0Xb3KZaO65XwM8+1QjA/0uB3Y+5egFB2hS1ozOOfaqdFRpmZjWvp
         ueHzWkChaz9fFw9LofLOY58NNx9n5ucxE8COf0uq9ANBWwYPJss1N/yyd+5p/bj8T77F
         OPwpSjZIKPddi2l7nJQFgGZtSmZfOR0cBGpv4EzbWVvXW0evrVkrRVuGv31mdodRva/j
         SZhCzK9gRO5+6T9Y/T18lH5z41EKTYWJhlJczcQeR/SD+6SMNjOwQdRgVWxxhUBA1K3B
         Xm4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV803M9+pF7hLE+WdqmT12juMYOlgNyIz6yPuidIi13E5uQd1r6kU7NzLxjJjkz1nqqsfGFk6Xsm4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZGd1E0gDl4eDR5m0qzzXLRMB1m8TxphgqkZI2vqyNiCModIY
	WA80tEsRdvv4a4cplFJaCVovEuPuX0Ld3oKZL6EYO5fESeC8sdPCsxWgn3gkHHxYXflT8iJBC3h
	9OhGnc9aKTTNrt3qRTXv/BDEFFgE=
X-Gm-Gg: ASbGncuPc/KwDwr+3gfs2vtdOXvyNAyTpL2zLtUw7k+PeLClU7bYcApC2Em9dUJoxVr
	8PHaeZLEyFDLv1qeG3IIOhTCy8fJCodgTwBxmB1w=
X-Google-Smtp-Source: AGHT+IE7llXnEfKfWReMARXI7cK1bVh1nqd1ea6h1SWpQU1a09xUoVSuhGj017Loe/e4kc+qiGvWd8EEOcsCQ76t1GY=
X-Received: by 2002:a17:90b:2e48:b0:2ee:48bf:7dc9 with SMTP id
 98e67ed59e1d1-2f1392950c4mr6451414a91.15.1734007434807; Thu, 12 Dec 2024
 04:43:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212100403.3799667-1-joe@pf.is.s.u-tokyo.ac.jp>
 <20241212103459276170c1@mail.local> <4048aa2a-8499-413c-a3d1-fe3e96e843ba@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <4048aa2a-8499-413c-a3d1-fe3e96e843ba@pf.is.s.u-tokyo.ac.jp>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Thu, 12 Dec 2024 14:43:43 +0200
Message-ID: <CANhJrGNcfkvv+0+jRYZtTSV8jN-XoOEEUcVUw3NnBBTpksahbw@mail.gmail.com>
Subject: Re: [PATCH v3] rtc: bd70528: enable the device's wakeup in the last
 step of .probe()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

to 12.12.2024 klo 14.04 Joe Hattori (joe@pf.is.s.u-tokyo.ac.jp) kirjoitti:

> >
> > Coudln't we have a devm_ version of device_init_wakeup instead?
>
> Yes, I think it is possible. However, for this patch, calling
> device_init_wakeup() at the end of the .probe() would suffice,

I agree. But...

> and I
> think implementing the devm_ function should be in a different patch.
> Please let me know if you think otherwise.

... I just took a very quick glance at the first four RTC drivers calling the
device_init_wakeup(). Two of them seemed to potentially leave the
device_init_wakeup() undone on some occasion. (Either in remove(), or
at exit via error path). I know 4 is not a good set of samples, but assuming
it suffices and extrapolating from there it seems there might be a few cases
to check. Having the devm_ variant should be helpful - and this would be
plenty of beans for those who do count them ;)

After that being said, I am not really sure how this is supposed to
work. Is there
ever a valid reason to keep the wakeup capability information around after a
driver is detached? I'd guess the enable/disable of wakeup is usually handled by
the driver, and if driver is gone, do we still need the wakeup stuff?
If we don't, then
it sounds like a thing that [sh/c]ould be automatically handled by the
core, without
the driver having to explicitly remove it. (But as I said, I am not
sure how this is
supposed to work).

Yours,
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

