Return-Path: <linux-rtc+bounces-2207-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F179A0132
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 08:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8472B1F22E1E
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 06:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483FA18CC10;
	Wed, 16 Oct 2024 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRm1ipzP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4F060B8A;
	Wed, 16 Oct 2024 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729059293; cv=none; b=RcCRceoo6gcy5YAoVpVVnxxDpKIF1q9N/fmEuJ5oWl8VtvspAsgDaApsZcK1zwHYxNd+Np/AHLk2xnYAopb+NM2OSZPchamWDL32+O6F1wTTRujKAyIF4aR0hPYUq/kooA8p++dabpGMxBUs4YV25WSsYFBbPPk7IGSXFEEur+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729059293; c=relaxed/simple;
	bh=/4e7XaluwgC/GjWMrTOSyyoL07pAfyL0HoFBTP7nhGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nijXa5fJ8drb94Nuj3nFGgq4qCMfvrSzjpJI7SLab3FEuGugEb+SuC6r/ivEBTw2lhSm7bgp1DGAB/NYowHBbW3y4J7c4u5tPrCZxxqYe6bAEpu854sxRzE8BJo0mzfbkwjxR9tZWWCMqdN/zj1LJOE1VgaW+TJDrrq3UCuxWMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRm1ipzP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A85C4CEC5;
	Wed, 16 Oct 2024 06:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729059292;
	bh=/4e7XaluwgC/GjWMrTOSyyoL07pAfyL0HoFBTP7nhGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mRm1ipzPVDTed75P46fsuOo/cHyiwrAa7XOUf1DS76A/KYWzsy0JdwYps3IEItePK
	 om4BfkkQNNcGK9RZWXIkHz7p3cPuMtjf88z1qyCxl0ZyioKWZIr6xhls7D7JZsoime
	 YAORQGe6AYBBhcgKcbMOJayTQ9Tbh8ynBoS5wBXiFJPl1av7FQSxCoWt5kgm8RTmvL
	 b/N2VAk1X1uq3SNubuTENUpsGp6CQgS0ssSbPFlK7Nw/wkuEqXm+RV1Cq6T20cBdI8
	 jgab4MLbi0JTVfS6CRG/Qxa2QeNA+CzE3wG6onkNtntkKXiSLK+iiG6iWlQy4pGQNX
	 c9mgQ4WJJ516w==
Message-ID: <d64cba44-db6a-4c44-9a92-10dc4e669a1e@kernel.org>
Date: Wed, 16 Oct 2024 08:14:48 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: add prefix modalias for rtc modules
To: huanglei <huanglei814@163.com>, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 huanglei <huanglei@kylinos.cn>
References: <20241015024322.15272-1-huanglei814@163.com>
 <c6b289f9-e5e5-4be3-8d87-f594cb15c61c@kernel.org>
 <49a7b611-f6d4-3002-c3f7-e3da221efc7b@163.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <49a7b611-f6d4-3002-c3f7-e3da221efc7b@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/10/2024 08:07, huanglei wrote:
> Thank you for your reply.
> 
> However, Most other drivers have already set MODULE_ALIAS,  such as 
> rtc-efi.c have set MODULE_ALIAS("platform:rtc-efi");

That driver might need, but this not. It's not an argument in favor.

> 
> So I think this is necessary. If loaded automatically is required, 
> sometimes it is necessary to match through this alias.
> 
> MODULE_ALIAS adds some more info for the userspace programs. In 
> /lib/modules/VERSION/modules.alias you can see the aliases that were 
> parsed from the modules.

Don't explain what mod alias is. We know.

> 
> In this case running  'modprobe spi:rtc-ds1302' would insert the ds1302 
> module.

Which is wrong. There is proper alias already.

> 
> Now , you can see the difference between applying this patch and not 
> applying it.
> 
> This is not applying this patch,  part of  the modules.alias related to 
> rtc_ds1302/ds1347 rtc：
> 
> alias platform:rtc-ds1286 rtc_ds1286
> alias spi:rtc-ds1305 rtc_ds1305
> alias spi:rtc-ds1390 rtc_ds1390
> alias platform:ds1511 rtc_ds1511
> alias platform:rtc-ds1553 rtc_ds1553
> alias platform:rtc-ds1685 rtc_ds1685
> alias platform:rtc-ds1742 rtc_ds1742
> alias platform:ds2404 rtc_ds2404
> alias platform:rtc-efi rtc_efi
> 
> And this is applying this patch,  part of  the modules.alias related to 
> rtc_ds1302/ds1347 rtc：
> 
> alias platform:rtc-ds1286 rtc_ds1286
> alias spi:rtc-ds1302 rtc_ds1302
> alias spi:rtc-ds1305 rtc_ds1305
> alias spi:ds1347 rtc_ds1347
> alias spi:rtc-ds1390 rtc_ds1390
> alias platform:ds1511 rtc_ds1511
> alias platform:rtc-ds1553 rtc_ds1553
> alias platform:rtc-ds1685 rtc_ds1685
> alias platform:rtc-ds1742 rtc_ds1742
> alias platform:ds2404 rtc_ds2404
> alias platform:rtc-efi rtc_efi
> 
> So, if not applying this patch, use modprobe rtc-ds1302/ds1347 may be 
> not  to load automatically.
> 
> Therefore, it is strongly recommended applying this patch.


NAK. You do not understand aliases and you do not understand what is
already in the driver.

Also, don't top post next time.

Best regards,
Krzysztof


