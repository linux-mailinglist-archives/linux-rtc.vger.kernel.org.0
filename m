Return-Path: <linux-rtc+bounces-1994-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04669979E99
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 11:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF2DF283589
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80744149E0B;
	Mon, 16 Sep 2024 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPvHXqk/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5540B140E50;
	Mon, 16 Sep 2024 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726479829; cv=none; b=sxkqgAZZdgx+cYL+ievEkcxhzWJe+83MdRHzwBBq2dMCz87wvwGGWentMKZbNgAh0Mu4Bh1eAxeBT/Ve+W7QiomyT67U2stSxJOhp++IFVBTTDTZgt5c4958raQg5YDjBMV9R9lqvBUGJvj1ceR1S7BjQr3LitPyXTjaE9HJDvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726479829; c=relaxed/simple;
	bh=uSLjVMOFtjZ6RN5n2oEbfcv69+hcDB7RedYfY0m4J3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1ZoqvhxNeEAlDm7PbNzCwh+q+UHXY99j1bPLO02lKWrv0akvPDhAgALizoSNF9mABD7jyMBZOiXjxHtbgS22j5xrL+tXwZQlC57fkw1ValIkQ+G5v6JVFBV2BibTTRyDjbp8AFhodwIzpvERD26hITYttfUbhodAi+Hr1JqGMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPvHXqk/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAD8C4CEC4;
	Mon, 16 Sep 2024 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726479828;
	bh=uSLjVMOFtjZ6RN5n2oEbfcv69+hcDB7RedYfY0m4J3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VPvHXqk/f8+eUm3LxYMPvdkcxy7SbCr6raEVx58xFF5uuoMAdjmOor+HmP+kpR4uQ
	 S5rJi/E+pDizyB24Sdqd/VhkL5bvN1P+oLHkU8SJ/0aT+NBngwKxvyuycU3vsfBLOI
	 2uq9egVifX2vRvfqUMgQjXf/q5X5nkrVAbo6nznPKKYl3KTUe7rcw3XOKZtFqzkeHQ
	 GiUm7lkvEPgLkW8s6O0NhV/I1p5gP4rVYHoq1zRGODBIHW1/dANXaFqHzhrM4Qoz5V
	 itDaOFF18Ft9W6Cj3+D73zeznIMWEsbAScczDZYMyfk/MvxqcTnqFt6AHCXvkdkUcY
	 ON0dvyU0QobXQ==
Date: Mon, 16 Sep 2024 11:43:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
Message-ID: <u5dtpbnnfrjwf5nmpxfug4fd5argwdu5oi4cogu2wiexkw3l5p@qxjxu52w3pea>
References: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
 <20240910-rtc-v3-1-1fa077a69a20@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910-rtc-v3-1-1fa077a69a20@amlogic.com>

On Tue, Sep 10, 2024 at 06:14:18PM +0800, Xianwei Zhao wrote:
> From: Yiting Deng <yiting.deng@amlogic.com>
> 
> Add documentation describing the Amlogic A4(A113L2) and A5(A113X2) RTC.
> 
> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
> new file mode 100644
> index 000000000000..eee994753a12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/amlogic,a4-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A4 and A5 RTC
> +
> +maintainers:
> +  - Yiting Deng <yiting.deng@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,a4-rtc
> +      - amlogic,a5-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: RTC clock source, available 24M or 32K crystal
> +          oscillator source. when using 24M, need to divide 24M into 32K.
> +      - description: RTC module accesses the clock of the apb bus.
> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: sys
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

If there is going to be a new version, keep the same order as in
properties: section.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


