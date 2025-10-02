Return-Path: <linux-rtc+bounces-5035-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D24EBB24F6
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Oct 2025 03:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 457DB32450B
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Oct 2025 01:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2C31482F2;
	Thu,  2 Oct 2025 01:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsN0aTki"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C3A59;
	Thu,  2 Oct 2025 01:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759370374; cv=none; b=u4PAzuwsglCla2CVbRJ9yrViTL1slA9hBwWPmDjYHvZgzolu4TX2irnbT5b95NPw6bhnAXoRCzPqcV0YbORLbmCmQHXH2Fx+TgnvQu7spetTbFXPFqemZR4VMkchPkBeByFy+JwrBJlZNYFkV700+Tz0jMA/+GY4Ye2p3JenOIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759370374; c=relaxed/simple;
	bh=s6b48NQ8wEXRVEHk+VMideyDag3KJCgqdCzmYO0WKVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWvbicRsCbeM0DsUXCmVHUpLKZJuVpP1OPR+jLymh46EtynQQQm5pjZDsJ6LWQKjKyrZqZYAWYfok2TwLjKAkbWXR59cc4UzmpmWZzRT56zy4V3voLnI3erRr9tQkqvMvf/f0gXr95ARYJ98bP4sKKqEprYNuc4/ExN8/EoZSdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsN0aTki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB77C4CEF1;
	Thu,  2 Oct 2025 01:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759370374;
	bh=s6b48NQ8wEXRVEHk+VMideyDag3KJCgqdCzmYO0WKVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsN0aTkiiqpHbj3YLGZLVisQwHwc7ct1dLLqG+Ipkf9j81zwX0itR9OvK8zoE15iX
	 hrPRJz2E+5KP12nYnCzrxUKfaszIjsFxI8zCoPHsaD19MiFEI1IUETrLYtKFBrEJts
	 A49UqNd+h43iSlmjbx741fLcPouAiJqdSPjN8YXHY+DCVXoDb9PRpyY/9VV1XyE7X7
	 k3wXsRhlCvX5E4yAGpl+TsN7fRao8UsC6eHpsxMFN3CcP8qDwZQS1zL/lsvdY1zLDm
	 iytj31KzHbsuF62Qj+rDCLOxt1f2H0KaT/K5mR6PY0UBqq/AeB4j2qKMNhsHHWwtB9
	 HRXyi2o4f7qrQ==
Date: Wed, 1 Oct 2025 20:59:32 -0500
From: Rob Herring <robh@kernel.org>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drivers rtc-pcf8523.c: add "clockout-disable" property
Message-ID: <20251002015932.GA2887697-robh@kernel.org>
References: <20250926091038.2262571-1-giometti@enneenne.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926091038.2262571-1-giometti@enneenne.com>

On Fri, Sep 26, 2025 at 11:10:38AM +0200, Rodolfo Giometti wrote:
> Some systems may require disabling clock generation on the CLKOUT pin
> even if there is no IRQ management.
> 
> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf8523.yaml        |  5 +++++

Bindings should be a separate patch.

>  drivers/rtc/rtc-pcf8523.c                           | 13 +++++++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8523.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf8523.yaml
> index d11c8bc16bc0..d18c396c06cd 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf8523.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8523.yaml
> @@ -25,6 +25,11 @@ properties:
>      enum: [ 7000, 12500 ]
>      default: 12500
>  
> +  clockout-disable:

Needs a vendor prefix (nxp,)

> +    type: boolean
> +    description:
> +      Disable the clock generation on CLKOUT pin.
> +
>  required:
>    - compatible
>    - reg

