Return-Path: <linux-rtc+bounces-4217-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24166ACC06A
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Jun 2025 08:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68ED37A141F
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Jun 2025 06:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F65718F2FC;
	Tue,  3 Jun 2025 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mYHKaXUN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x3wkdYho"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6222844C77;
	Tue,  3 Jun 2025 06:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748933248; cv=none; b=AgCmlbtWk1Fo+r1u2VScr/WhVqjhwWAeD0UuYxISW5+T5W2aBnjdeq5l1fwGnfXVPB7mXSY1tePlzTlCXEvU519hOSRfpikpbjpREprRrwRg1Exwc7XTD+BhnSKQH54u3+DTrYalZhDCXgZF8U8ctypPOOPJtLG48T0/uRCvvsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748933248; c=relaxed/simple;
	bh=yp+9sKIhPdDXtas9pZoS0jPZviUSGnyYWahyc9QKxkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaFoObumPNLD+4YLHBh6Nl4KB5JKJdiCXPPKAlt6y65aG/tbPc6PwUEYcyCj/1+zsmQ1LfyAGdp1M0Fq68GIegWPJgwSYGy9epZrh1wUNUH8mH70wA6hv/UvhIyU5nXmnS49GzBpUrsWmN8dhkY9tQ/fmO2tAdbThEO+5iQbebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mYHKaXUN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x3wkdYho; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 3 Jun 2025 08:47:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748933244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yp+9sKIhPdDXtas9pZoS0jPZviUSGnyYWahyc9QKxkw=;
	b=mYHKaXUN/RI6kgOykdtQ7nN3v2FCJFLwmFAMu3VzzaExTUM3fl6rBlzw7iuRcbo7rL3T97
	irsOFIkOPmn/u8EtPsCxrU6UH/hZ1E0Y5bRXL3wL1gB/XksySofsQQmbkvbNEGdnBJLAkI
	ZxU42Xg4Telth6u61KoU3qIvFHUcvuVtkfGDy+Xj4yl2HBUsux1mpOIbNlW+EhsW+b3QWV
	zZMrj42hUhQeVPklVdQED1D+0onNjD7O1YZrlLcOR+mQdbxN/7O5POO2I5MzTm4hHSJ5bF
	Luy4UFspBoFxzn8pB8toIpl0D3hcULof7diWzBC4PQaZsx1BsSeJvKA7RiftZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748933244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yp+9sKIhPdDXtas9pZoS0jPZviUSGnyYWahyc9QKxkw=;
	b=x3wkdYhoiYUOw9zR/PzGBRoE1g5iWseODMlYnLNAS8laCtgGl+RE961n0evV74K2ZAzVXp
	dZwe0fXLqO8ISeCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [DRAFT PATCH] rtc-cmos: use spin_lock_irqsave in cmos_interrupt
Message-ID: <20250603064722.xpshWggM@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250602202019.625331-1-mat.jonczyk@o2.pl>

On 2025-06-02 22:20:19 [+0200], Mateusz Jo=C5=84czyk wrote:
> cmos_interrupt() can also be called also in non-interrupt contexts, such
> as in ACPI handlers via rtc_handler(). Therefore, usage of
> spin_lock(&rtc_lock) is insecure. Use spin_lock_irqsave() / etc.
> instead.
>=20
> Remove the local_irq_disable() hacks in cmos_check_wkalrm() and add a
> comment so that these _irqsave / _irqrestore will not be disabled again,
> as in

This also broke PREEMPT_RT due to disable-IRQ -> spinlock_t.

> commit 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock=
 in hard IRQ")
>=20
> Untested yet.
>=20
> Signed-off-by: Mateusz Jo=C5=84czyk <mat.jonczyk@o2.pl>
> Fixes: 13be2efc390a ("rtc: cmos: Disable irq around direct invocation of =
cmos_interrupt()")

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

