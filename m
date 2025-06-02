Return-Path: <linux-rtc+bounces-4216-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59EAACBCA6
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 23:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8132B3A1337
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 21:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D9281749;
	Mon,  2 Jun 2025 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QX/uzXWE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6572C3251;
	Mon,  2 Jun 2025 21:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748899169; cv=none; b=d9MVqW9Ggsr0HAosaZ9aW7BSEVC5F2v/YfZD7PXGRSYzVWrp+4dHC4iCEBBQRNQK9nXhXuTgXc2Wk4i28v/YemkDAfafSzbpkKEv0G4jP1NAlULhG8Sm7eRLADTRwM1E1f4LBBsabtR6nC83bipWPUALAA9ykVCeQm07JmquMGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748899169; c=relaxed/simple;
	bh=fA7kkOGHTvsZ6p5lbH9wX+TNESc5QgAkSJcorlZrVM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvlLoZ0jZUsIyl5e3FULcNdoEOWy4Wv9wMQ+t+w9pv6ceos1HQYfo2EBXcH7z/NYTwpRZmdk/LoFpuOyCjRHLmxgUp0VgxNyY6Y0cpqDUMdHxFUNzVKOkzdKIi9mHuoMojLLBqBsCrto5HIyTb+9pQOgvDH3nlshi8uVclXV+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX/uzXWE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so14051265e9.2;
        Mon, 02 Jun 2025 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748899165; x=1749503965; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jkp8Zo9nGduEKF5bIjgb1RX1iaMvxoQSzr2bwuYc8UQ=;
        b=QX/uzXWEiZL152rCkU85ZrAhZ7lf9GwqRoNrhlXMuLp18tYXhel4CzsRTGjwTX7qEH
         UJmmTkJ+kYZbo/hZhcoOg9QWeAaiEmwH1sFvjnos+J19FwIx4WEYn7e53GZdMfRt9vyh
         T2KDQUqBVJJmtb0g41YBul/LvKXn7/qpzTmN+W7BlL7hsui9kYvP8iG608+aYEhxcezT
         7pjUxOzunfis+pzaogF5EOUWRr88hYSWsXg3c3oRuLU6OpGuLKVFsMdiSIVXBqDx46m2
         sB7IyJsK8Z3WB3Gm7vT4HaHhtPYvOwi20Ici8/o0QKKC5fh8CuK+9fJM/qy+V+luqil9
         gYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748899165; x=1749503965;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jkp8Zo9nGduEKF5bIjgb1RX1iaMvxoQSzr2bwuYc8UQ=;
        b=Ef8ME42nfsjcUXyx9s2YyvAhjWpOZ9pJyU2eY68kyOxzZKdeA8/GTrrVG0Dx0l9lQX
         XfOqzTiOU5e68FAmrCcSe+bWusx4DtQVS8d7UdEn8Swpz3gbCTMh7+yLOLTuc3pcA5XV
         1VHZqreIdlSPxmTnkgPgsGjmy0x749GFM/FTal/vvRI6FkLCDlKN7ZL/y/MPciLwMUYc
         SbL3wgdKbyuK0aAiOk813CUnxaB7ygWgg0EckRvQ3nM/MXd8MmbqZcyhTt0FK+HeTqa8
         1TtGi1tzmjXCltC3rwZxvjuEYa7icpOY2FKqEwyCaHTUicUeGuM8PZMuv9wGwD8ztAoh
         Ab+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlnymfLv6EEJDpWcHuEs3Qet/rCtAZkbIrR3ITsFjLHjr6XIF+QkxKxnfroE74HIazrCQUGF7cQ6eY@vger.kernel.org, AJvYcCUukhUflmuQkcsw31XYbt15Md0/QDQ2Dl/pz763gqw0idlpGCkHsl53Y8WfY+j7x3Znio5BJ+wndm2BTX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJyFQV0re9ydPNN/gTGbi8IFnrxSvpIegsXiPgjn5x6LOH0PX9
	JIwYkz9bhfc19WcljeuiFYw9g2KTAJcZzAHdpmhXZPSDHnJKiRDv/0iUwzbDfoRL9FU=
X-Gm-Gg: ASbGnctvWSSrefTCXFWaOV5TBa8figqo64WT7Rc55jSrsT/ffEEMA8yrZdTTvMfNDZl
	I4bPLANWyY9XI7atNLw9U98ETNJRsydjnHnsXYNNTPu6ux/YvKUfBj8622alysoqCx4t5onhHVd
	urxjkEWZnBxPn5vSNzHT49Za14UAZ/xmyUy080pPf69fjoZeOLOQJbr0tjmJVP8esYcM3gjPZXj
	viaFLUMf29OS6AK8Tu6rvVX86UQW37QnBkMtASfUOv+Un/xC/DWF4P224SSvH+Qwbsr9ktBltre
	4PS9RJ6QZ7GziwF0H5gipu7JM5LT2tJ6GCUOhrHPtpilhfpov8bj1VZEh7KYqbydnZZuqMo=
X-Google-Smtp-Source: AGHT+IGIJAoFS2NiL1tf4NFBAQyjhFxYI/D+mNHMut91QdUhNHMvaxDM+oCYR+cy8Rl7Vchth6p6IA==
X-Received: by 2002:a05:600c:45d0:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-450d882b456mr106362175e9.5.1748899165290;
        Mon, 02 Jun 2025 14:19:25 -0700 (PDT)
Received: from debian.local ([81.78.104.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm134425025e9.9.2025.06.02.14.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 14:19:24 -0700 (PDT)
Date: Mon, 2 Jun 2025 22:19:22 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [DRAFT PATCH] rtc-cmos: use spin_lock_irqsave in cmos_interrupt
Message-ID: <aD4VWov2L1pJfxUY@debian.local>
References: <74bcd576-d410-45b2-aaf0-05aedf96b8be@o2.pl>
 <20250602202019.625331-1-mat.jonczyk@o2.pl>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250602202019.625331-1-mat.jonczyk@o2.pl>

On Mon, Jun 02, 2025 at 10:20:19PM +0200, Mateusz Jończyk wrote:
> cmos_interrupt() can also be called also in non-interrupt contexts, such
> as in ACPI handlers via rtc_handler(). Therefore, usage of
> spin_lock(&rtc_lock) is insecure. Use spin_lock_irqsave() / etc.
> instead.
> 
> Remove the local_irq_disable() hacks in cmos_check_wkalrm() and add a
> comment so that these _irqsave / _irqrestore will not be disabled again,
> as in
> 
> commit 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")
> 
> Untested yet.
> 
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Fixes: 13be2efc390a ("rtc: cmos: Disable irq around direct invocation of cmos_interrupt()")

I tested this, and can confirm it does fix the "inconsistent lock state"
error in my test case.

