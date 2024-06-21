Return-Path: <linux-rtc+bounces-1383-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD19128CD
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 17:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C80D31F27D5C
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 15:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C704D47A66;
	Fri, 21 Jun 2024 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SuypfJph"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BDB47A4C;
	Fri, 21 Jun 2024 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982201; cv=none; b=jet+UpIkK5FRi4FA8f4dMWgD5geOfY2xi/7A074a+teHQc4LHwsspLPo2uzrK+bGhf4X6La9iDZHxqITVi81Sub4ZLUfTumNXOcJakb6xg//6QQhBuMfernDz6+tOMhiwli+NdOJzMjEf+OmvnwC5cG3li4iruirIFzeeBMqrAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982201; c=relaxed/simple;
	bh=mHg+TybOHtOAmIgNPcoUah11ra0PgiuqsoffSKove2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ll/tILpqFbH3lYceJVUN8lgQd4oWHSth1idnKpMPRFioaSHB7rUP6oDcSEhUaKxnuP+et6LQRVlhRy+IMKnE/TvBS4KkTrS6z8iVIzv4tgPQkKtW0wERCGNQ3nT9hRLiDOuFfJdpjq1+JE8NQcH6+0K/dVojs7Vp2nA5omC6ap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SuypfJph; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 795F940003;
	Fri, 21 Jun 2024 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718982191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CPQNBZF2T4OwsyRXKPeKHMueHnpDIXDCfTcrUfs9CyQ=;
	b=SuypfJph33aGeMO+JfCa4k1Se77o5KwqAfZBgKPaNOEoSjpxjLwksVEzyyXBHXZ1UAEllu
	utrcgZIYmVu1JJnAzkO1KAIHFJROPFg3zXV5Y4GjSoax+er9iOUvyyadIwdf9PfVmLMdtF
	hYgLaCrfeZ5mXbWSCoQbJbnZ+nq8naSH3gcN/stRyIdBZ/0PC7Wuw+N3cne+J/LfJPpnJt
	oS2BoYZeogb88X8h01yKqrfdYSGymT1UHZGHFQnr2VeaQOCHimseoO/cmPiDFY6YxjqQuV
	88sTOr2nNIb/rkCVOGPrpXyxBMpX/xx9ldKMVv2CYoVXA8j2rD+fhmFAwy/NFA==
Date: Fri, 21 Jun 2024 17:03:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Sean Anderson <sean.anderson@seco.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Joy Chakraborty <joychakr@google.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] rtc: abx80x: Fix return value of nvmem callback on
 read
Message-ID: <202406211503118dfe2df1@mail.local>
References: <20240613120750.1455209-1-joychakr@google.com>
 <171895100442.14088.18136838489262595773.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171895100442.14088.18136838489262595773.b4-ty@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 21/06/2024 07:23:24+0100, Srinivas Kandagatla wrote:
> 
> On Thu, 13 Jun 2024 12:07:50 +0000, Joy Chakraborty wrote:
> > Read callbacks registered with nvmem core expect 0 to be returned on
> > success and a negative value to be returned on failure.
> > 
> > abx80x_nvmem_xfer() on read calls i2c_smbus_read_i2c_block_data() which
> > returns the number of bytes read on success as per its api description,
> > this return value is handled as an error and returned to nvmem even on
> > success.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] rtc: abx80x: Fix return value of nvmem callback on read
>       commit: 126b2b4ec0f471d46117ca31b99cd76b1eee48d8
> 

Please drop it from your tree, I'm going to handle the rtc related
patches...

> Best regards,
> -- 
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

