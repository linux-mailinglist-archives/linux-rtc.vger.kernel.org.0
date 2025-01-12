Return-Path: <linux-rtc+bounces-2885-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3FEA0AC9B
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 00:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7C037A1B75
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2025 23:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711281C245C;
	Sun, 12 Jan 2025 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="feTup4NZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3131BF7E0;
	Sun, 12 Jan 2025 23:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736724092; cv=none; b=iP1zMtXWr6qIanD1eJCsNWC/2CkFP8CemMOIHx38sjWm+aqmAXjVRewjTFMIz1CWO8JImOstYzdqs0EIi29Jn3/X2bY+RtT+tBK8UXJavLuZ0N2PpI6K6PyRXYIDZMQUzLxw/dJaAtJnwEacJ/GFJoFdqpc5ylobWHBJhb6XFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736724092; c=relaxed/simple;
	bh=9clxHogCAD5/jbOmit1s3wQ2EvDCYSz8MZeiLhZIp/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrzdG2YjZL+KJLKMMbSShdqUEUPEYjcTLuElH05HLhaA2OQjuNF2bx3w0if4YxMwHVUQJJ3w1k4SdI8gPQAWUPtHy/MsmnIf+nLLjAyw06ETgIko4VNkumVn1pJ/UpcbaRiB2uX84UnE+MueCxvH0gK2kYEs1Vfl6hoDWjZhf7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=feTup4NZ; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B323F240002;
	Sun, 12 Jan 2025 23:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736724081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=foxZ4OPCvLORpxi9EKDR8nn5Jms+wKcLcYMTxUyJCyk=;
	b=feTup4NZMCNIg8ww0bruHEYGXZKPs0EuMBNTG4RDe32aiGQmCOf6pYtkziirMKKgiX30vr
	McsxfujL5Ccl/CG0fVeK1DWLjzOALiBT44KCZgTDz2gBWkQwsouT2KLMO71AdjLXRN1E99
	undVABrdFggMYyId0P1LWurbIcrqbclD4DZ8t97Te4nU7SvBddTZY4kxGFN3BOfKRApONX
	yyXbEO/X+UG/3x259FwvyoWWFYBpanMNe8KNvIEt94pWLcMaNo484eC8QuMOMYcCkr8Yhc
	0u0JdvPUr4RWcGQdYBSmSqQt17W9P34+VJ0UlG5a/cGcy5acSP5TrcGbH8drVA==
Date: Mon, 13 Jan 2025 00:21:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Esteban Blanc <eblanc@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: tps6594: Fix integer overflow on 32bit systems
Message-ID: <173672406962.1487447.9603474833606557636.b4-ty@bootlin.com>
References: <1074175e-5ecb-4e3d-b721-347d794caa90@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1074175e-5ecb-4e3d-b721-347d794caa90@stanley.mountain>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 11 Dec 2024 12:32:34 +0300, Dan Carpenter wrote:
> The problem is this multiply in tps6594_rtc_set_offset()
> 
> 	tmp = offset * TICKS_PER_HOUR;
> 
> The "tmp" variable is an s64 but "offset" is a long in the
> (-277774)-277774 range.  On 32bit systems a long can hold numbers up to
> approximately two billion.  The number of TICKS_PER_HOUR is really large,
> (32768 * 3600) or roughly a hundred million.  When you start multiplying
> by a hundred million it doesn't take long to overflow the two billion
> mark.
> 
> [...]

Applied, thanks!

[1/1] rtc: tps6594: Fix integer overflow on 32bit systems
      https://git.kernel.org/abelloni/c/09c4a6101532

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

