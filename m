Return-Path: <linux-rtc+bounces-1942-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB6975CFB
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 00:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 573A71C222CC
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 22:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5E6183088;
	Wed, 11 Sep 2024 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U0gbmCae"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE21714DD;
	Wed, 11 Sep 2024 22:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726093111; cv=none; b=q+MbiDS7jUvkPbv9E0he2Cb70+mIQSCDD/dk7KsgrB22du8kL4LwNeDQP/kSx1Stoo6azH6Ml1QxsyAhFZnAOV/FYyIpaOKoxIYieX8enAQ2qlQyNd/qpTGdnjIxwgWRwMRQi2dCw3DJvNzXOnHs/cNLoJaXPso6xazChouJme0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726093111; c=relaxed/simple;
	bh=1USpe0n/W2zW0Qc+brfMbvrdVwUPcFTycr7f4S3U8j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAwUmL/mOKGfcu8hAGF5/A0p0SZvtlYgiklSmhMceYUmrAZskzqtD/r63lrDkqLQm+ONBKlv85+L56zIYq1tRJzsTl1kxZkggJYriiAhzEkO7HWR+tDMmVhRaWwv2vYYZlK2bNs/bHBJzeIw3dhwfF0t2o1kxmPvlt9TIJfYptk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U0gbmCae; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA09440002;
	Wed, 11 Sep 2024 22:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726093106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fyCM/YaJqrx4b+ECD8EcT6WiqqWLFpqMCtcVzj6djrY=;
	b=U0gbmCaeTRExLw8iBzPmxwWeh4nLZ8aaznf0CL7FazWjGvxOjnpIlKrsio3X04xHYfsifU
	rv4MEY70H9MejTBVat1TsMQFklTh/x80sfzdhVZuzappkXHNLwv91Vc3GdFztrKWhPFcvM
	lFoIq/54CudOZ1RPSX5US8LJ1zOBU38CjNIwxBZxHRpzR6oGtWU2M1FEsHR3WclJ5NtNNC
	YeTpNX2sSnZQSNNWtfh8SpMwKkWTpH/cnzj+7iWjQiL5WWv+5xGlk1elCcRUFnl/9URTkZ
	hfAUKSqWlmZ08l9gwaEKjPRCD984Am3KER84MkhvKR4Td2dSHrU99YvY/VGOsw==
Date: Thu, 12 Sep 2024 00:18:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: tony@atomide.com, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: twl: convert comma to semicolon
Message-ID: <172609305462.1547920.5064447854215657634.b4-ty@bootlin.com>
References: <20240716030252.400340-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716030252.400340-1-nichen@iscas.ac.cn>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 16 Jul 2024 11:02:52 +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> 

Applied, thanks!

[1/1] rtc: twl: convert comma to semicolon
      https://git.kernel.org/abelloni/c/2d611fbe9a85

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

