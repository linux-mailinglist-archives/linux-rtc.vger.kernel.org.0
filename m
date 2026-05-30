Return-Path: <linux-rtc+bounces-6591-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNeUFWiTGmoe5wgAu9opvQ
	(envelope-from <linux-rtc+bounces-6591-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2026 09:36:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C5A60B99B
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2026 09:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17FCB303D12C
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2026 07:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC787393DF2;
	Sat, 30 May 2026 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGyo8Ujh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A605626ACC;
	Sat, 30 May 2026 07:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780126543; cv=none; b=dh3ApjlE0LuBPnQY6uhmZJVuIVqm/SFaS9pDM2tUF1ZQ0Avv4BEM0j6UoQV86eB7XotRqZI896JGu13a9A5y65YCllYJxNlxN/lnmsOV94bYsPyeCmqAhEDq3DNjyhBjyctBP6lXjteg9iuXe9tK+t6XquVqYlJS7otizwZlQgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780126543; c=relaxed/simple;
	bh=fz4kdclOKSBRy51d/iLLaCqas2Mv20qDCh8w8frH0mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcvEavBGO8V63RiFpco5KopQpYpd1Mrdc3AODKT21ejbQ3l4kt+9irEYipDWz4q12nbPv8lcUwDkHqXijv3H15qL7+5MIK+KpUebIY2lJnSguMh0vvEkCe2XflYur+fYJjK5D/Dg/7ZRXBb6KqeUY8ZEiZFk89cKZOqYBI38ET8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGyo8Ujh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A491F00893;
	Sat, 30 May 2026 07:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780126542;
	bh=rDIbbdNi1ZPTfTLbF+VNsLtotcL6i/wU5AbKPo4BQ64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGyo8Ujh7/+5pZQcje0jWZ1okxvyqmivYsmzANrPJxwM5VOM9DRmFKOUCVLobY0Oz
	 QJQwPydZay0rb8blSuZeM5GE/rL6j7+M1uwH3xa/BNyNqNKp7oH3tvLOeZhxYtE7nF
	 stSptYVpiS102sxmLswqT1OnHnOXt4lVlJdamL1BQwbLRIkPRwBaml7Kg1gZ/tdlRW
	 vE8mnRl78aoUFjjNtudZnG4QyltEfR+kRt5jr9L3qXy6ajQsnhLumQC2qf/wnRX5OI
	 NGH/7XWhc9/bR10lfEeahEMiHvSHgHxv0IW2M0YbpepqQO4FgW61FnTjWONigEXrVE
	 /9rxZXxxmRpxg==
Date: Sat, 30 May 2026 09:35:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: clock: via,vt8500: Convert to DT Schema
Message-ID: <20260530-academic-aspiring-sawfly-7dcfab@quoll>
References: <20260524151110.21277-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260524151110.21277-1-challauday369@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6591-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: A7C5A60B99B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 24, 2026 at 08:40:26PM +0530, Udaya Kiran Challa wrote:
> Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
> controller binding from the legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v3
> - Add schema select matching for via,vt8500-pmc
> - Allow hyphen in node names under patternProperties
> - Add dependentRequired validation for enable-reg/enable-bit
> - Fix example validation against PMC schema
> 
> Link to v3:https://lore.kernel.org/all/20260524111813.39810-1-challauday369@gmail.com/
> 
> Changes since v2:
> - Drop redundant description for clocks
> - Disable reg property for device clocks
> - Fix schema hierarchy to match actual DTS structure
> 
> Link to v2:https://lore.kernel.org/all/20260521170810.19702-1-challauday369@gmail.com/
> 
> Changes since v1:
> - Add default value for divisor-mask
> - Add required properties compatible and model
> - Fix example node name
> - Update example size cells and reg value
> 
> Link to v1:https://lore.kernel.org/all/20260520025131.17772-1-challauday369@gmail.com/
> ---
>  .../bindings/clock/via,vt8500-clock.yaml      | 209 ++++++++++++++++++
>  .../devicetree/bindings/clock/vt8500.txt      |  74 -------
>  2 files changed, 209 insertions(+), 74 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/vt8500.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
> new file mode 100644
> index 000000000000..51a68df6c2f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
> @@ -0,0 +1,209 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/via,vt8500-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA/Wondermedia VT8500 Clock Controller

How PMC is a clock controller? Really?

> +
> +maintainers:
> +  - Michael Turquette <mturquette@baylibre.com>
> +  - Stephen Boyd <sboyd@kernel.org>


Subsystem maintainers do not care about PMC. This can be platform
maintainer.

> +
> +description:
> +  Clock controller bindings for VIA/Wondermedia VT8500 and Wondermedia WM8xxx
> +  series SoCs.
> +
> +select:
> +  properties:
> +    compatible:
> +      const: via,vt8500-pmc
> +
> +  required:
> +    - compatible

Why do you have select?

I don't understand your changes. This was not at v2 and I did not ask to
change that.

> +
> +properties:
> +  compatible:
> +    const: via,vt8500-pmc


So via,vt8500-clock.yaml or pmc? Why aren't you removing the pmc file?
Why is this located at clocks?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    type: object
> +    additionalProperties: true

No, this cannot be "true".

I finished review here.

Best regards,
Krzysztof


