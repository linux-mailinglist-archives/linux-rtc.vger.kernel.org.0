Return-Path: <linux-rtc+bounces-3707-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D12A76029
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Mar 2025 09:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B64F9188A7E4
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Mar 2025 07:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6721C173F;
	Mon, 31 Mar 2025 07:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pilpS5yB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F318CBE1;
	Mon, 31 Mar 2025 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406536; cv=none; b=PMGxLC3g/Q9aW5/t9NAsXHHTJS4TfYkCKkXyy7c+AU7ttTBpmv5r80v7XsAp0XbfLqI5yRnMyxP1Cb6Xmzr8f5gTNHaMmamSy7+zt3QD+sZHshCQ1m25nBVtwVsGmfAntJXtfegWZ1QpCst+mDG7LZ2CXcfS83LtR97UqSMRQug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406536; c=relaxed/simple;
	bh=A9Gk5MXC1bSvKeS45s1VhPpZ/lnbaWeef++2Cj5TGAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZmxELzayAT9HwZN3k22UHBh8tBLwZ3TrIGBeBd8OEiWZ01CZpnBZC41Vz5zOHqYWc9E8z/13B6qgmRVmGC0nFBrW3QyXfxM/9mPLoEKhM2HEw2pErPPa2nLJRM2QvtblzQs6OWde6ZlGumXO2FB1RagWjxdVMTrtL4//EPcF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pilpS5yB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBB2C4CEE3;
	Mon, 31 Mar 2025 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743406535;
	bh=A9Gk5MXC1bSvKeS45s1VhPpZ/lnbaWeef++2Cj5TGAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pilpS5yB/toibhVDR8rY0m7ycyfC5hawxGsTGDW/VPp0f1Xd6BKxY29kHD/DvmCYU
	 dl/xdf0J5NUGnUy2vgBGU+5ggVuvsJNmRIltssUaNxPpa2576LurQgH766ty9dK6re
	 vi9L7PFdeQy0uoon7VQQrgw6uIJuEIVETMXoGTiAPreGmDr19lUNY7MCVkTf0amHfk
	 7eUmO703he7zl/995od8Qe/sqSJAn5WKM6XP3ylOxWa5vb3YrpWtPNim6evjS8sxuJ
	 6jvitXsd411vVm+0fGLlsT/ZyCjycmWTgmUfyScux49+i5TYl1lqeN6PWwejHha3Yj
	 tgqxnHr1lczdQ==
Date: Mon, 31 Mar 2025 09:35:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 03/32] dt-bindings: firmware: google,gs101-acpm-ipc:
 add PMIC child node
Message-ID: <20250331-shaggy-mutant-scallop-cb4866@krzk-bin>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
 <20250328-s2mpg10-v2-3-b54dee33fb6b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250328-s2mpg10-v2-3-b54dee33fb6b@linaro.org>

On Fri, Mar 28, 2025 at 01:28:49PM +0000, Andr=C3=A9 Draszik wrote:
> The PMIC is supposed to be a child of ACPM, add it here to describe the
> connection.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml        | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..5524f2af5bda2d29b5113f8fe=
14ece7f02366a60 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -27,6 +27,16 @@ properties:
>    mboxes:
>      maxItems: 1
> =20
> +  pmic:
> +    description: Child node describing the main PMIC.
> +    type: object
> +    $ref: /schemas/mfd/samsung,s2mps11.yaml
> +    unevaluatedProperties: false

Drop these two and use "additionalProperties: true".
> +
> +    properties:
> +      compatible:
> +        const: samsung,s2mpg10-pmic

Best regards,
Krzysztof


