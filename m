Return-Path: <linux-rtc+bounces-2408-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5369B86FF
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 00:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BD74281E8D
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 23:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01461E0DE5;
	Thu, 31 Oct 2024 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DFj5fcrw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E3E1DFD81;
	Thu, 31 Oct 2024 23:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730416783; cv=none; b=qWY4wfHIjwoqnEXvTCSc0LpCm0gKLeTzupnbItytxLQD1nU9LrS8w/oHwIIyFDgvAdj4dKmDIzGdIC+IQUhr6Dl32G7fkCq6nhK5pnHvP7bA/ZS1xmwvtGPtCNH25cHvmPcX4J7wzSwEKeLOrLDgGOSOOfkG6AfIzBzJX0SY/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730416783; c=relaxed/simple;
	bh=WbpxuzdF/aAPqb8D5YYBFYBBEyxXs9OMxENeJB48SX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oidEoFxq4AudwAMowKX1tFAQHEhiXXN+sQZ4+wCRLwKLBnp0zFMmq+yNpZ02m77A2eCl3u+U4J5wTyJHXKtZbni9HWVNAiV6JB3bW3Ugq2/fvnY9BiUrfGS1djdYqkqf5eoIt0M0eQF1wFGavEuugIAadkAcZiY0ebZnrsjFp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DFj5fcrw; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CDC9240003;
	Thu, 31 Oct 2024 23:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730416775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5z9zdQZdn+zNttfWGlxZQQmSzPWLPgZ9wK42vO4Z99Y=;
	b=DFj5fcrwWedEAv97V+okKIg8EgYTOTDolTk3Nvj3qmgfej6r//dHGAp0SqAdaP4rLmiKup
	n0wJud8KS5kmN+K4zr4GM5rtYaAHz1pnJj2AFcFgUy8TgGJPTALCfU4XqaMoK67d8tMHCj
	vIahM1qbouOV8XMXRQO0gJjtJxVae6Dc3r1baVTYglsmfhu0NZhOHSMu4+kMDRbM2aNFKl
	tWBQpijuPUOHBVrn1yYm0EmI1wksDAz7+7XeBErO3wHAH4t21mlkejdibXAKXqRe95q4w5
	Z1yYxqrug/BCDmEdft5zY6oVKu3Mw6oyIecHOXJ5C7/EqMKzPVTB+SwhytVjww==
Date: Fri, 1 Nov 2024 00:19:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Joy Chakraborty <joychakr@google.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: avoid taking rtc_lock for extended period of
 time
Message-ID: <173041676668.2394637.4445020791361338594.b4-ty@bootlin.com>
References: <Zxv8QWR21AV4ztC5@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxv8QWR21AV4ztC5@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 25 Oct 2024 13:14:57 -0700, Dmitry Torokhov wrote:
> On my device reading entirety of /sys/devices/pnp0/00:03/cmos_nvram0/nvmem
> takes about 9 msec during which time interrupts are off on the CPU that
> does the read and the thread that performs the read can not be migrated
> or preempted by another higher priority thread (RT or not).
> 
> Allow readers and writers be preempted by taking and releasing rtc_lock
> spinlock for each individual byte read or written rather than once per
> read/write request.
> 
> [...]

Applied, thanks!

[1/1] rtc: cmos: avoid taking rtc_lock for extended period of time
      https://git.kernel.org/abelloni/c/0a6efab33eab

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

