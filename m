Return-Path: <linux-rtc+bounces-6246-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEQ4HgCjw2lssQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6246-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 09:55:28 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 682D4321B4A
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 09:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 344BF300C541
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 08:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0839B39A04B;
	Wed, 25 Mar 2026 08:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vHX1DI1s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD27330C366;
	Wed, 25 Mar 2026 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428898; cv=none; b=RCLLaMH1NNm7Yag5aJN7tqmNog1OUMrlHzN/VNUhtXvtx7EgAtsvjCyYqCnQT8sTB0+JPGDoWsTAA6S2S88B4kmhqQq4G3ImxnArAgEnpaDF1njXBxbzL43Auu5fcmKJoMQOajyIjM5egIsdDwTXD0s08PvMGLVYrrXCIApouUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428898; c=relaxed/simple;
	bh=uBNGX6/ohZpOh4VJX6xaJ9Yp3oIzzgxxBOENBpJ2j3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIbr80/pYHx/A+yCfPv+NSMzz+VPKBGm1BwCZaPAugw/73wJPSXjkoAa8Za1K3+uH79+xPrbiu+c/6OXrfP1b8UCpF+33fCvbNUhSTgWEdtXTxyS0Uw/XQWo6DJaUeOBcPDQycfmEkK8xbEzZBTZJVySx+ecC6zxZ7O/d9yoVQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vHX1DI1s; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 48E934E427EF;
	Wed, 25 Mar 2026 08:54:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AE41601A1;
	Wed, 25 Mar 2026 08:54:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9324910451011;
	Wed, 25 Mar 2026 09:54:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774428894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=oifiJRo3htFrgRTCzmDDZEZuxfqk2csmmaaOHwOCET4=;
	b=vHX1DI1s/eXFtZMGY9C175IeiDzLZHL5h0zIm4Swi/TMYstES0uFMexlPhbd9qFoSRkDRL
	XEQReM0m7SEOVEpWx9d6bq0lnm+E6UW5GeDxAvxEjawyzMwdHz+3Zia657whad+FtQAWtO
	42JCrWbGyZH1EzvquRmft8mDjQqrhqFDEaiAIsUYO4QxPFz2clEe5gFVUz3j0ryMXDvftB
	rfgu+Ot9kls9JcEufgI2yruSS0g3T+U6Yw6/vsfstY7sIoEM+qoielZJND1Nvz0/xMQTCe
	N7jWw78LFRlIf2p6PFACAOAjzThfPPauhEyJLoIKuHpoHwiikKdQ4fEwue14mA==
Date: Wed, 25 Mar 2026 09:54:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dsd@laptop.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: Convert olpc,xo1-rtc to DT schema
Message-ID: <202603250854523a8809af@mail.local>
References: <20260325084708.40629-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325084708.40629-1-anushkabadhe@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6246-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.local:mid,bootlin.com:dkim,bootlin.com:email,bootlin.com:url,devicetree.org:url]
X-Rspamd-Queue-Id: 682D4321B4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 14:17:08+0530, Anushka Badhe wrote:
> Convert the OLPC XO-1 RTC device tree binding to DT schema format.
> 
> Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> ---
> 
> Note:
> * This patch is part of the GSoC2026 application process for device tree 
> bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
>  .../devicetree/bindings/rtc/olpc-xo1-rtc.txt  |  5 ----
>  .../devicetree/bindings/rtc/olpc-xo1-rtc.yaml | 26 +++++++++++++++++++
>  2 files changed, 26 insertions(+), 5 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
> deleted file mode 100644
> index a2891ceb6344..000000000000
> --- a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -OLPC XO-1 RTC
> -~~~~~~~~~~~~~
> -
> -Required properties:
> - - compatible : "olpc,xo1-rtc"


I guess this should be move to trivial-rtc

> diff --git a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml
> new file mode 100644
> index 000000000000..a5f029a4de92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/olpc-xo1-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OLPC XO-1 RTC
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - olpc,xo1-rtc
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rtc {
> +       compatible = "olpc,xo1-rtc";
> +    };
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

