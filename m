Return-Path: <linux-rtc+bounces-3523-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 210E9A64D91
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 12:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75444172FCE
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 11:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B8B238D5B;
	Mon, 17 Mar 2025 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMsRMSbm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A62238156;
	Mon, 17 Mar 2025 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212690; cv=none; b=cfp++JcWr6oNB4wu+qV2NEAG/FGPjUdn5rSg37/C4Ag3RmfPLJ04/mLUUZQaxRVRvVd2Nd2bhSQ6qwvRMv/1j0NToGOTZfL/MSW+W0LLF6JWrgdB8Kyq9+2IOom7eJtTYPmJLx2b2SpVNmZ5fWPHyLWJCfQJRssjO0e5crsM3d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212690; c=relaxed/simple;
	bh=sq/y7ToMuiEYjILLs9HwScQY78qLtJ+EUzbHvYcFahE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iff4WLdxORbYviuF7a/Kg2Gq6+xXO6z4OceydbFQow9L1nya45YspfAzQRr0Zd9GU2ypfuiWBH3P9Rb7mWKsLfaaTx5HFjc7AfG4nPtOeKxAi6OEJ5Y/HxI7Cy8/HiVkPzWykcKg9me52Cz/jEa9SjEPv1fZxPuXxn7TQxIeRDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dMsRMSbm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7CFC4CEE3;
	Mon, 17 Mar 2025 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742212690;
	bh=sq/y7ToMuiEYjILLs9HwScQY78qLtJ+EUzbHvYcFahE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dMsRMSbmEjUg08T36jpvjIpXopIOqt3lksnDPiquVrUU+ZcuZMintWSixY1KecFBK
	 u5IGvl1PdEgpsuAPWLllxe285atv/fUenvzZzLvSznR3p/YqdVgNwpmCq+zQRYAgPy
	 QdFW8ftA4jVqU2xAy21Hkb/bQMgz9qoxivpkY6GBayzOG2UXTGdYZ7CmFEtSD6fpJa
	 87zI6f37CMVxNktP7yFMy1XZCnj6WnUJElxv1htNDhpik7A0fuL9KW+WGqDaahxBNy
	 ZnQMlFXPQc1pWKncdLkfWuFAgI9JyHRGRHqFiKXZormATHM+J5vXhNW+ct3zA/hbN6
	 Xvn+zG5UsibLw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tu96d-000000006pl-3dZv;
	Mon, 17 Mar 2025 12:58:08 +0100
Date: Mon, 17 Mar 2025 12:58:07 +0100
From: Johan Hovold <johan@kernel.org>
To: alexandre.belloni@bootlin.com
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pm8xxx: switch to devm_device_init_wakeup
Message-ID: <Z9gOT5WBaGkBZjl9@hovoldconsulting.com>
References: <20250317111312.1518349-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317111312.1518349-1-alexandre.belloni@bootlin.com>

On Mon, Mar 17, 2025 at 12:13:11PM +0100, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Switch to devm_device_init_wakeup to avoid a possible memory leak as wakeup
> is never disabled.

You should probably mention that this was due to a bad merge. The
no-alarm patch moved the previous call to device_init_wakeup() into the
conditional, but you had switched it to use devres so we ended up with
two calls when you applied the patch.

Unless you want to and can rebase your tree.

> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index c6241a0c26e9..70cbac76147b 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -647,7 +647,7 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  		if (rc)
>  			return rc;
>  
> -		device_init_wakeup(&pdev->dev, true);
> +		devm_device_init_wakeup(&pdev->dev);

So you need to remove the call to devm_device_init_wakeup() above as
well (after platform_set_drvdata()) which the no-alarm patch moved here.

With that fixed:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

>  	} else {
>  		clear_bit(RTC_FEATURE_ALARM, rtc_dd->rtc->features);
>  	}

Johan

