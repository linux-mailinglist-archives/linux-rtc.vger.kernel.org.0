Return-Path: <linux-rtc+bounces-1314-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB259908C68
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 15:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57AFDB20DFD
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 13:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D8019A29F;
	Fri, 14 Jun 2024 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eIOibX3E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEECF195961;
	Fri, 14 Jun 2024 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718371307; cv=none; b=n4mzP/S0cV3/MurNxbIiqTA2tyfGQXIXk+IBZLMR80+lr3qcx207+gxxI5oqtDk9dd9cDCX9bBNipAZOPSf+Kg/TKhNsuSGAmbCBDKH3/SYTlS1bD7u6EiCcNGcwZB7VYGEtvD7VQg/ZgOnZ/Xv7xgYjIKiFJoKIeSAzVLC0fsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718371307; c=relaxed/simple;
	bh=7G6tn8ZyG7QAMVi7rPOLYkfy2RhrHRg8uSOQWLI3sxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8y8Ihw2kvpOZmkGdFIR6rfUqKqlFmzIMb4Y3uk43COqriHn3rTkn7lPAnn5HagL2YJFzYMfgl7xnpSPuflghNoJ3QVOKNcwtlVfepa7+sHoqm3o67Qyr4rvL+2u7rvR4R11LRH9qFaNJadi+fex7E29Og342/b9+rMKlBlNnBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eIOibX3E; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3B6D20004;
	Fri, 14 Jun 2024 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718371302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3bisbdv/hmM5UUk6uHPsWFkuNwh7ywEzWMqtbjydPQI=;
	b=eIOibX3E0vpBbhRAprjPpRdDgkHnylG0U8oliqdb9AWc/P90sqnwYSjo0eufPLIvtjxkGJ
	pucN7mAvRICnUBuLZoAQhtLpxBwtxsERLxKyGI/HiJ7wh9cR7A+a/SGkjcJ7l6+H/zygrt
	7sDsgmnNnnwoc52qhpD1SiLJ8/VFldZYX1zBH+Oxnvw6UW6nAN1iMd0LMgbiJuGz7K3fDu
	FrYTrjZWKOm/9g48e8QmMJkAUXq0Wq1hg+oI1UEKF6llQOINAvhXUDFCyjq4UON/1AUN8o
	ILxDHt0bfOk8cYcG2Tv867EFJvqdDBb5S4IpU6Vow/EolP+0M56Jhm3kuiZCvw==
Message-ID: <09168a9a-d8a3-43a9-b8cc-fd88cff9db82@bootlin.com>
Date: Fri, 14 Jun 2024 15:21:41 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] rtc: tps6594: Add power management support
To: Richard Genoud <richard.genoud@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Udit Kumar <u-kumar1@ti.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Esteban Blanc <eblanc@baylibre.com>, linux-rtc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
References: <20240515152827.80185-1-richard.genoud@bootlin.com>
 <20240515152827.80185-2-richard.genoud@bootlin.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20240515152827.80185-2-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

> diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
> index 3f7c5e23cd4c..85933f1519c4 100644
> --- a/include/linux/mfd/tps6594.h
> +++ b/include/linux/mfd/tps6594.h
> @@ -1011,6 +1011,7 @@ struct tps6594 {
>  	bool use_crc;
>  	struct regmap *regmap;
>  	int irq;
> +	int irq_rtc;

irq_rtc should be stored in driver data.

>  	struct regmap_irq_chip_data *irq_data;
>  };
>  

Thomas

