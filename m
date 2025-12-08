Return-Path: <linux-rtc+bounces-5509-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E951BCAE467
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A532430530A6
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCF32E172D;
	Mon,  8 Dec 2025 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LMEehbZ+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE12E0922
	for <linux-rtc@vger.kernel.org>; Mon,  8 Dec 2025 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231737; cv=none; b=KIvTu5A4TRunPBOa7Zf/IrP+AxPBwCBQWhN4LJX/ngELaq6+1cmQnoU1rSQAJXWoiZuehH/X9kNGhNJd+XP0lTdfKgdb9gySGjGPMdmqBgMGSB30OGfFnvgzF+z9NractPplGGEGO/h9vzthrkwx/bvsHYOZSKwiBinM6UK/O68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231737; c=relaxed/simple;
	bh=gSmYTd2aoBc2jdYJ/YEF1OoaVPkBnyItJ6VbM/70cQc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ3zooQ9eEwVpcqK2FiXw0vnrqRVBkkcf7oWvjlQOYtEZsBLQpPlDpaIOUsCGXjgrBQIp3JKRaPyGHqEn2dJIGEL6++Si8oqpDn06JHoyvfwebNA6RRwlk/+w0BnjlqT4KiJeEKEQvUkNm0TzY46yrb3PWpzkBiIB2RLhvgBEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LMEehbZ+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 14AD71A203F;
	Mon,  8 Dec 2025 22:08:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE067606DD;
	Mon,  8 Dec 2025 22:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFD42103C8D5C;
	Mon,  8 Dec 2025 23:08:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231732;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=F+q/lc0m41Xrk18HpU5wiR+zeL3mDBfmvgcOH5YQ0So=;
	b=LMEehbZ+jpHefGopCXCAacU32qeXKjzHHykpSpCUaa9iHR7c5pCuQaEq/TCaxSCYIxUJBo
	0ETu726Au2q8ZiP9zVaoEmM+4X7zLQwaflYV7kqE7w2VuW93CZ+YwpxpGJEEgM+a62oyd5
	SaUeFFOLAWVSYUPQ74IpHfv8gP3ltBs2ee0Aa5RRoB0MkmpJlKU4ZkBaO9xBWP40hBRFcd
	4Z481o5P/zWgV5SZsjf6UUDFved+t2n9ffqh9HmDGhH6IeMlZx3vDyhu7kpALluoSKSXCF
	Uv0mliJHYyCP1RPtomT60qZRTApcbic9rY2JPvaFyUmepN88nfq/cMCX6WaRgw==
Date: Mon, 8 Dec 2025 23:08:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexander Kurz <akurz@blala.de>
Subject: Re: [PATCH] rtc: Kconfig: add MC34708 to mc13xxx help text
Message-ID: <176523152338.342815.15677107096947364029.b4-ty@bootlin.com>
References: <20251011062605.13591-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011062605.13591-1-akurz@blala.de>
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 11 Oct 2025 06:26:05 +0000, Alexander Kurz wrote:
> MC34708 is one of the three mfd devices supported by DRV_MC13XXX.
> Update Kconfig accordingly.
> 
> 

Applied, thanks!

[1/1] rtc: Kconfig: add MC34708 to mc13xxx help text
      https://git.kernel.org/abelloni/c/53e71c177cd8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

