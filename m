Return-Path: <linux-rtc+bounces-1451-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 154109295AC
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jul 2024 00:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8831281DBF
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jul 2024 22:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C942557F;
	Sat,  6 Jul 2024 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ntVPJpj/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FBE81E
	for <linux-rtc@vger.kernel.org>; Sat,  6 Jul 2024 22:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720305713; cv=none; b=YGmV4Hh53dNCzf2J3vrCR6+w8TtV7mQr78hYZShMkQ0RLNWkgPtjALEBosAVHsNZ29eZwZARNuvpOh5AUvUszE/HRJWPw74zA8cWWZMi/I8n2UTpWEUr2ng3/1eO3EDYp46oplBIWp+M8759GNNOMYvpIS32Jt81nITbFJlRBEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720305713; c=relaxed/simple;
	bh=XewjQTfRq6dM4JwnzP2NTgJqSWO4ybAGPjFOYZcfdK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFkDWDBsjX3hvd1yRj6tnkyApIb5F0p0Ja9GIdATmWES84dS1SiSR3kDofe0IwBu1P/7u4mRgRy6i7U7Uxu7XbafXwTvqIe+FGzk/IajtfeTHV5LYGTnzgcYJhjsCW1gUBeQC10DDdX/t4YkYkZjjfkaF72FjoKT/TlgEk1SRPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ntVPJpj/; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 8C911C28BB
	for <linux-rtc@vger.kernel.org>; Sat,  6 Jul 2024 22:35:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F10AE20002;
	Sat,  6 Jul 2024 22:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720305304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AtNJV0iKkiKnCwuoK14rCU8mhNC1hQlAtrgPocbYy0Y=;
	b=ntVPJpj/weti0kN/DUAPVHAdoVp6GSTr3efxCLQ/9F8BIa3Vhvv0yyHxv+JNvROALXSJlD
	/1YpUFv6msumsp9I3sk/yqySJyt4cZpYoNA03U8dBNuBPIh3DlHTtdeLrYelu7vtIQtHAt
	6iU8VZ+NfbF+JyevdHQTqjesdEh0eFTqAf/uwvkNDnr/D7hItuOFqdpire23PeBTk+YcdT
	Xu8Jpv4F/q14RTyxUGSaIhR92C4jQGfP5eM0mjA0D18DHxq6arvUszk1xG4Skul2V7ywlL
	lfbxd7kgyhjOkuTg8PMUL3C+s5xSCdeyPHYb8jLVvzMcsFc9ALwPPiHrJGWSkg==
Date: Sun, 7 Jul 2024 00:35:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] rtc: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <172030527565.498069.8431505628244697461.b4-ty@bootlin.com>
References: <20240515194336.58342-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240515194336.58342-2-u.kleine-koenig@pengutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 15 May 2024 21:43:37 +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> [...]

Applied, thanks!

[1/1] rtc: Drop explicit initialization of struct i2c_device_id::driver_data to 0
      https://git.kernel.org/abelloni/c/33c3f6b6c383

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

