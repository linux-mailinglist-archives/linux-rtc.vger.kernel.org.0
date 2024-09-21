Return-Path: <linux-rtc+bounces-2044-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1897797DF8D
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Sep 2024 01:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB06D1F2162F
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Sep 2024 23:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF0E154425;
	Sat, 21 Sep 2024 23:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K5Qao8jo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A18BEC;
	Sat, 21 Sep 2024 23:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726962234; cv=none; b=ZfmSKoRrdUFfw1Ts3FXiPXUELzP6b9Jlex7QeslDyRuA+CnB95iZZqsJTSHrObEZI4PmAAiXC/8ccqBeTGQs61+7ytUx5Qu73HX9ZaCGMvV80bgYLlf/oKWifSi3xYPTvDt1Yr7k96gaQGti3xUG/Uz+wN1lPI/V3ITsSmHSBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726962234; c=relaxed/simple;
	bh=+BGAsLE36zVsTJqm7vmjnYCYPyF+jJlfEf5rI9mvhR4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jud1L8JqYjFNqNCXzZSNnfYoUE7UDzsEMI7D6c5awaj//o+JrvfIOKalZAADrOGuSMEyS3KMJ6uMqP24frYfYV9P2qxudoaAqQmfP/Vuc1EhUauVVo2kC16QqCWySE3puT/RmBzsbzhgJUMuSQbekb16Z7X5+v5kG8J9fxIQ48Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K5Qao8jo; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 83351C0479;
	Sat, 21 Sep 2024 23:19:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BA48E0003;
	Sat, 21 Sep 2024 23:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726960750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pd5piRkOyvNtkB5wA7K5ClTk4Ahw21GKP2WyPHgRnuc=;
	b=K5Qao8joQDe13wllMXkZkHrI27p/usJcJ/a8lx6QxKwAdxxR06G4QnWBYkr2rlZEg0ARyy
	eEql93l6BUSy12eMPOcvImUkcLSPiz8YGLqG8/IFaqaem41asCCKT0nSlGvCtqCuCiVPGb
	TBgh8nUck7eO0/S3c2FSZ1cQa1VlkYtrYS7yK2h2W+Z0jL8I3zAlQZP/mAiPL2WcSaxm9c
	+HeI6G4AXrRLUUm07pa3VE9fq8/sJm2ymOwfVp4n1QXWcR4IteBcCb39oukVUVRbwzs9cp
	k3niH4ine8fwWA7yqgDr4SjB4+OmZBrMzZRBQtgkdk9W9Qm0q8cb//B/wc+acg==
Date: Sun, 22 Sep 2024 01:19:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] rtc: rc5t619: use proper module tables
Message-ID: <172696072277.282436.6650836078742883740.b4-ty@bootlin.com>
References: <20240918212159.1191637-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918212159.1191637-1-andreas@kemnade.info>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 18 Sep 2024 23:21:59 +0200, Andreas Kemnade wrote:
> Avoid requiring MODULE_ALIASES by declaring proper device id tables.
> 
> 

Applied, thanks!

[1/1] rtc: rc5t619: use proper module tables
      https://git.kernel.org/abelloni/c/690286214916

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

