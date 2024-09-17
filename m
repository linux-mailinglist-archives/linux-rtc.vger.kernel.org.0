Return-Path: <linux-rtc+bounces-2012-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590D97B605
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 01:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E662C1F2598E
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 23:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC88E18A956;
	Tue, 17 Sep 2024 23:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="HwY71rt/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4397D158D6A;
	Tue, 17 Sep 2024 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726614971; cv=none; b=HcrM7DGuzczc0+f/bnLNNGpFKoHzxreqGezAU+ynAE5AvxksM+YLQSdtUVwdXqYy/p6odm9AJ0JZOYK+vq9VmVrLfeGki3waZOHQiAGkbtDIPrmaZ+LzE5TMRQ1AU1iZCJ9UsIA8Aff5cEI4KrAMOMvgJ7aYqK7oulq0RsopXx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726614971; c=relaxed/simple;
	bh=hKdPBZkHU6g0/s+bJFTHAh61szvrDgYoABJpwLjFb3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BeASoJpln3J/l+JTYcRKqSYtiKUJvBbe+JroX6W/Im+8xDxXK6bwLbDHaPcJxUDAJPNlv3sDObY25g7c3/fbDTd3c5nK9MWfFZPhyn1OSVFx9HIcCQT63PvcRc5D7rp9AgJzbOqliSuV2orkOHOuMKmcG8jrhWlg6U1T/YhZre4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=HwY71rt/; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=40wm3mtRL5sJV1zlzoc6UE0S8NFNw9Lh5DHK9lkWm6w=; b=HwY71rt/FVc/VdGqFqiuLisH1u
	kjD53brKWLSRBEZleE2U9ioYp3XixxrIujBonicrzeTG1yGXcbdB7Y8qfEGxxxVPaURsSMkkND3b7
	eMPcBB7H/KVPd9PAjIjNxRLLxalEgMAQ/HiKGGSEIJbsrUVfcB2tAMNkJ51le5RgSGBqIc2DyG2Hv
	wEPqcFjgctPu6qGsYKBIOwCRGTeJpU5J1fX1wNSkqRO9zOiJKAh8fmfeXN3JL8xl6qq2ucBC7CllY
	7zchmkYEshE9b/zoUrrbbuxrYMoPnAcL3cqDPwaAYulL+B8DqkW4/OGzHYQBVTmo9UV5bfhKj2eWf
	LY2B/FSQ==;
Received: from [213.164.25.30] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sqhQR-00013I-4e; Wed, 18 Sep 2024 01:16:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alexandre.belloni@bootlin.com,
 Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Subject:
 Re: [PATCH v3 1/6] dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt
 string
Date: Wed, 18 Sep 2024 01:16:02 +0200
Message-ID: <2206048.Mh6RI2rZIc@phil>
In-Reply-To: <20240912142451.2952633-2-karthikeyan@linumiz.com>
References:
 <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <20240912142451.2952633-2-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hey,

Am Donnerstag, 12. September 2024, 16:24:46 CEST schrieb Karthikeyan Krishnasamy:
> Add rockchip,rv1126-wdt compatible string.
> 
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>

I think this patch misses some recipients because neither
the watchdog maintainers nor the watchdog list is included.

We'll need for them to at least Ack this patch, so they'll
need to be included. Please check your scripts/get_maintainer.pl
call


Thanks
Heiko

> ---
> 
> Notes:
>     v3:
>     - add watchdog compatible string
> 
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index c7aab0418a32..bccd27a1e470 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -31,6 +31,7 @@ properties:
>                - rockchip,rk3568-wdt
>                - rockchip,rk3588-wdt
>                - rockchip,rv1108-wdt
> +              - rockchip,rv1126-wdt
>            - const: snps,dw-wdt
>  
>    reg:
> 





