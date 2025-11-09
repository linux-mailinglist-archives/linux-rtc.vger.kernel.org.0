Return-Path: <linux-rtc+bounces-5304-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C2C43A60
	for <lists+linux-rtc@lfdr.de>; Sun, 09 Nov 2025 09:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9138F3B201E
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Nov 2025 08:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7192C1590;
	Sun,  9 Nov 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="IUsWLpCM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9485920102B;
	Sun,  9 Nov 2025 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762678758; cv=none; b=oTE7Mnv5ndNgUZ+KoyfUxOagdE+QZCPanMuNXrLU+SRYmV6rVKQm5WYHwP9W7+CtsRmJaJBYO4sdbdIOyOvvSXczcGeO3RX37xI6QxPn4j4NE5KPejxqrsRRyfRD1uw7SW6zkYab6G9HtV45mKK3FHWzJVJ74xlyr4F+/A5sbQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762678758; c=relaxed/simple;
	bh=NIHTz/OoDgmGZXlh3rApI4xKI1Lcg03ixB3x9I+bkWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4LMFWp+Sttwf1aX7xq2rlMN3m1DMYrUnJi/PZNktZPGVcYj4LUJhOWYtQnpEzIVxFvn7UR7MauX/V3saSGx2I/KeKhtuNsqaSArQqZ7bQWW04FaWRshG413zarKmcXZxHvfzhZYcUa1EuYw25qVeOCJwhHCfCd95UnLJjMNkjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=IUsWLpCM; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id I1GKvCutnh1kKI1GKvZT3p; Sun, 09 Nov 2025 09:59:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1762678747;
	bh=ryN6OIWBoqgz2Ty3b+qLcani7MHBs1yOn6/7cVXhrqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=IUsWLpCMzOagE1B1RapkxoJBbwX3CzMtARrKHk6x/d0qJfKE8FJ40pCcXNFKJOvMv
	 3i16bDxgey4ixnzmbOI6WkEWyhKsP8OvwOSExb+ilLJV7Um5TyB8hXYipBmI0Vfcqj
	 cCSs4+iZSaFSeu88UeJ1yVfNyEdifUAA8Y4kHBB3woKhz8CcU+by/vtZ/bm+ehegj2
	 XrOY8/DtBNcdIr9EdtVA6kSkdwEMwh74YJb1Vl5AlrVm2TSjMBiGcmTNN20M3yaInA
	 ZgA0DJG4eE0yba5rkbahUmQ8HJoBoEfdV5iDIaE5DKNlODQClpzdqrTT36xtObPUfu
	 zbpPu10JvLQPg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Nov 2025 09:59:07 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <cb5c891d-a266-4228-9189-b53bf0d26322@wanadoo.fr>
Date: Sun, 9 Nov 2025 09:59:03 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: Fix error handling in devm_rtc_allocate_device
To: Ma Ke <make24@iscas.ac.cn>, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, stable@vger.kernel.org
References: <20251109060817.5620-1-make24@iscas.ac.cn>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20251109060817.5620-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/11/2025 à 07:08, Ma Ke a écrit :
> In rtc_allocate_device(), device_initialize() sets the reference count
> to 1. In rtc_allocate_device(), when devm_add_action_or_reset() or
> dev_set_name() fails after successful device initialization via
> device_initialize(), rtc_allocate_device() returns an error without
> properly calling put_device() and releasing the reference count.

The correct error handling is already in place and your patch looks wrong.

> Add proper error handling that calls put_device() in all error paths
> after device_initialize(), ensuring proper resource cleanup.

This is precisely the purpose of devm_add_action_or_reset().
Look at it and at the devm_rtc_release_device() which does what you expect.

CJ

> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3068a254d551 ("rtc: introduce new registration method")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>   drivers/rtc/class.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index b1a2be1f9e3b..db5f33a22b14 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -379,13 +379,17 @@ struct rtc_device *devm_rtc_allocate_device(struct device *dev)
>   	rtc->dev.parent = dev;
>   	err = devm_add_action_or_reset(dev, devm_rtc_release_device, rtc);
>   	if (err)
> -		return ERR_PTR(err);
> +		goto err_put_device;
>   
>   	err = dev_set_name(&rtc->dev, "rtc%d", id);
>   	if (err)
> -		return ERR_PTR(err);
> +		goto err_put_device;
>   
>   	return rtc;
> +
> +err_put_device:
> +	put_device(&rtc->dev);
> +	return ERR_PTR(err);
>   }
>   EXPORT_SYMBOL_GPL(devm_rtc_allocate_device);
>   


