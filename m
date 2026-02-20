Return-Path: <linux-rtc+bounces-5985-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP+RA+0RmGnG/gIAu9opvQ
	(envelope-from <linux-rtc+bounces-5985-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 08:49:01 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F33B16561D
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 08:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1778301496E
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 07:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6914930B50D;
	Fri, 20 Feb 2026 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/fdBHpr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439AD30AD05;
	Fri, 20 Feb 2026 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573738; cv=none; b=q9W8rvtIH5A2dPs3BBpH9RyAKty+moIl4BOtwdWxs4h1BXZPQ71sDuPNmsP+2i/LjAZURJP5K6SqlMcLALYLL9QYGXfKHBiyPtVRPD4+i0dvqAhEG6V0Lm6FL7EIJdfevzxTP2Pd707Hb5tehhZmpDuaGW3UQl/2FxcndPl/Ug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573738; c=relaxed/simple;
	bh=DdUlZ8vqgYkP6ATI/j0iVvdjFFAf9k/hYpx2LX1ha4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nl83/O1eswWY1kKkdzS2xPwyRTtH1mhujPk4EvtIEk0NFWe4ONVJng3AY9OYU2PvkKPBiVrgt+/lHiWn9Mh++QJOUKLAbbdP0sYahfqg2hSZ6/NmPF+Bs3rqA4dti+SKxdZUs8wzh5mSRhg19rUvmahBHinsXHSLHN84HtxFVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/fdBHpr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9332DC116C6;
	Fri, 20 Feb 2026 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573738;
	bh=DdUlZ8vqgYkP6ATI/j0iVvdjFFAf9k/hYpx2LX1ha4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/fdBHpr5Exf5MER8zdck37ew20cDKsM5BvVRtTWURYtSemTei41gbH+/bXTdtdpW
	 HiVbT2YJhBZrM1ZtLDrb3SFOugsWSrIbb9BnN+kLDXL56pbU0wxBV+rkhzj5A8q5xu
	 C10hVgHEtzPlMTL/zFBlnQo0Q9HMUIFhPp+fJOHPFBFnXH44DmpaOKzvGintaJtWPS
	 YglWaT4JiKM2XDf88en6tcKvwj2ZLqK+/c5jV1JwUdlV7613oGEeqSZAGf1VLv86OX
	 JspHxgwp0/BLkE1d69VwC7pozT62GykCwvjjaw7DZSowR/T//goLmaVWKptRAcxTM4
	 XbqI+VaqW64qQ==
Date: Fri, 20 Feb 2026 08:48:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: rtc: isl12026: convert to YAML schema
Message-ID: <20260220-vigorous-holistic-platypus-6ebebd@quoll>
References: <20260219055115.195302-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219055115.195302-1-piyushpatle228@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5985-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F33B16561D
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 11:21:15AM +0530, Piyush Patle wrote:
> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml b/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml
> new file mode 100644
> index 000000000000..a6822605fd72
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/isil,isl12026.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intersil ISL12026 I2C RTC/EEPROM
> +
> +maintainers:
> +  - Piyush Patle <piyushpatle228@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The ISL12026 is a combination RTC and EEPROM device connected via I2C.
> +  The RTC and control registers respond at address 0x6f, while the EEPROM
> +  array responds at address 0x57. The "reg" property refers to the RTC
> +  portion of the device.
> +
> +select:
> +  properties:
> +    compatible:
> +      const: isil,isl12026
> +  required:
> +    - compatible

Why do you have this select? Look at existing bindings - NONE have that.

Just in case if that was not obvious: don't send us AI microslop.

> +
> +allOf:
> +  - $ref: rtc.yaml#

Best regards,
Krzysztof


