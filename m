Return-Path: <linux-rtc+bounces-2124-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F8C9966CE
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 12:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 981431F21D1D
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 10:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E6118F2EA;
	Wed,  9 Oct 2024 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQlbSrVh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370A18F2C1;
	Wed,  9 Oct 2024 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468956; cv=none; b=jKBUtHN7LDz9upg/gUUQ4kYaI/KvgAdWPq7yBiHsuCPmcSCMHOoA/LgKiBv2sQ6C2xXAydXHy8mbuSRsTVWjbyPeN04izcPZ/zUvfFcwnPBhOogasxjE3tPDhmNtIfQmluf4FKTsxeLCxQQ9tuL+2IVIk62sabJW7eS1A1eThC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468956; c=relaxed/simple;
	bh=oJArf3enTGWI4lzclyQMV/yzQ9goQcfcnoHHYndnucI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNfWOkY7DNzqdfVrhdAXc5eRoGCDmD6hnzSB7p3sa1GDrZt2YKrt5+b0+IndbOUirLb4/eXkF5S/0bOZEX3M7BK+irmL29cz4mMwG9QAXMaUUKnto/euR76SVzTzo4yCl0IhVGAN7fSH1wwWwPivAm3k4dNt06RLNMj4x/i8Xvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQlbSrVh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38614C4CEC5;
	Wed,  9 Oct 2024 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728468955;
	bh=oJArf3enTGWI4lzclyQMV/yzQ9goQcfcnoHHYndnucI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQlbSrVhseLPe3QZ/N+IXeO8Y7LGIQ0puUnCn5fIioS+vHeFwut1BjP9AtsBj76HT
	 vvtr/r+nT/TJsWT7daiR3gHLG39/0BFEZI6in7YM8Kl5yO+JxSHWqsUMfMpM2Ubpvk
	 XGyukpAgZEPtsF4aIfJuwCXSaHvCHClIFF73ldWmEV16eWieDTaWmx+WtLx8gGG7/T
	 hT88HZNNYZQvbkyF+9jCusNSkJRYhTgfgSHioxsFItQ4yJG4wC+Ol/7Axpp6FxerW1
	 tookHvRe+TK9t1Yu2+JmrN2FyK3yaMrkUQ7GzDXVUEWK6biV7YJ3mz35n2Pet+jY4f
	 LygVL/7SlXTNA==
Date: Wed, 9 Oct 2024 11:15:49 +0100
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, eddie.huang@mediatek.com,
	sean.wang@mediatek.com, alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com, macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 start-year property to RTC
Message-ID: <20241009101549.GB276481@google.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>

On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:

> Enable evaluating the start-year property to allow shifting the
> RTC's HW range.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++

No such file.

>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 953358bc997a..a83cc35f51f1 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -71,6 +71,8 @@ properties:
>                    - mediatek,mt6366-rtc
>                - const: mediatek,mt6358-rtc
>  
> +      start-year: true
> +
>      required:
>        - compatible
>  
> -- 
> 2.46.0
> 

-- 
Lee Jones [李琼斯]

