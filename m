Return-Path: <linux-rtc+bounces-6499-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFMuAC7lBWoAdQIAu9opvQ
	(envelope-from <linux-rtc+bounces-6499-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 17:07:26 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D7543B9A
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 17:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3920301E6E0
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 15:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A0940B6C6;
	Thu, 14 May 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzUL+5ET"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6063DFC78;
	Thu, 14 May 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771111; cv=none; b=roQIxgywNRkbKl2AQbtLbCRzCeIvBl02CvziLHNhYLHk3UmnED8gzRjKgVbXSz1/93VC/bfnUdxsVg+SwazXlDOY9+MBVZy0jIjelkRVtm3m/HP7ASiddfBZrgkF0hMgHFrUujZ43BC0Vq0DYVWVPluzD8Oie42MbIdWeBCYX5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771111; c=relaxed/simple;
	bh=y+qWkfH2NdW0SgzpFUw+pNdGVOYGMAeHSrTAVJ8Wd6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LO0H1lNO5sUDl9FiILUvuWK5COq1ntCE67ski/JRHIzX5dazOISJZFXeaXniFTj3Boo3peNmehl+F5vV/pWje062G4Fb7aznXWDMByxVho/gPBBG89T/irb5/qq44X4sjU5wqj5SqRJXTvrgeXgG743C4egXrDXSJtNPxxIp4IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzUL+5ET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CC3C2BCB3;
	Thu, 14 May 2026 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778771111;
	bh=y+qWkfH2NdW0SgzpFUw+pNdGVOYGMAeHSrTAVJ8Wd6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzUL+5ETuBp68+uAJmjs1ENvWvR7Cv6qPq8mewr+POZ+cdbB7WCVi5LXJATo4rnFp
	 5Pmdo+uJNjhemnabCCXcFkZ2Zu64tbubILBxwO4+CYT5uX8x3WhdYGmBfYc2bGkSsx
	 EHiv/IrzUzYVg0ke8JgImhcSRBtDvnYcN5NjdiD53SKBp5BPzcKe0MIUr6ZB+FecmX
	 8abyt6AbcR5p7yf9+zWlezkeFL7PVb2MPB3cASTV5HRhjzdKwZ5hth/4Al8rq3CDmR
	 vFfNXGKa1D5S8oEWbghjovfCz7lsxa+ROuZWGDSuXzERpUfaDoRFK9a0mw8vqA7kJ3
	 FGKyR5ad5F/jA==
Date: Thu, 14 May 2026 10:05:08 -0500
From: Rob Herring <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Message-ID: <20260514150508.GA495076-robh@kernel.org>
References: <20260509185735.21557-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509185735.21557-1-challauday369@gmail.com>
X-Rspamd-Queue-Id: 522D7543B9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6499-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.32:email,bootlin.com:email,0.0.0.3:email]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 12:26:39AM +0530, Udaya Kiran Challa wrote:
> Convert the Epson RX6110 Real Time Clock devicetree binding
> from the legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v3:
> - Add conditional validation for SPI mode properties using anyOf
> 
> Link to v3:https://lore.kernel.org/all/20260509181909.21871-1-challauday369@gmail.com/
> 
> Changes since v2:
> - Reference rtc.yaml for common RTC properties
> - Add conditional validation for SPI mode properties
> 
> Link to v2:https://lore.kernel.org/all/20260509095713.5818-1-challauday369@gmail.com/
> 
> Changes since v1:
> - Reuse common SPI peripheral properties
> - Drop redundant SPI-specific comment
> - Remove unused labels from examples
> 
> Link to v1:https://lore.kernel.org/all/20260504183728.27412-1-challauday369@gmail.com/
> ---
>  .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 ---------
>  .../devicetree/bindings/rtc/epson,rx6110.yaml | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt b/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
> deleted file mode 100644
> index 3dc313e01f77..000000000000
> --- a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Epson RX6110 Real Time Clock
> -============================
> -
> -The Epson RX6110 can be used with SPI or I2C busses. The kind of
> -bus depends on the SPISEL pin and can not be configured via software.
> -
> -I2C mode
> ---------
> -
> -Required properties:
> -  - compatible: should be: "epson,rx6110"
> -  - reg : the I2C address of the device for I2C
> -
> -Example:
> -
> -	rtc: rtc@32 {
> -		compatible = "epson,rx6110"
> -		reg = <0x32>;
> -	};
> -
> -SPI mode
> ---------
> -
> -Required properties:
> -  - compatible: should be: "epson,rx6110"
> -  - reg: chip select number
> -  - spi-cs-high: RX6110 needs chipselect high
> -  - spi-cpha: RX6110 works with SPI shifted clock phase
> -  - spi-cpol: RX6110 works with SPI inverse clock polarity
> -
> -Example:
> -
> -	rtc: rtc@3 {
> -		compatible = "epson,rx6110"
> -		reg = <3>
> -		spi-cs-high;
> -		spi-cpha;
> -		spi-cpol;
> -	};
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
> new file mode 100644
> index 000000000000..3466f74736d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/epson,rx6110.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Epson RX6110 Real Time Clock
> +
> +description: |

Don't need '|' if no formatting.

> +  The Epson RX6110 can be used with SPI or I2C busses.
> +  The kind of bus depends on the SPISEL pin and can not be
> +  configured via software.

Wrap lines at 80 chars.

> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: epson,rx6110
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-cs-high: true
> +  spi-cpha: true
> +  spi-cpol: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +if:
> +  anyOf:
> +    - required:
> +        - spi-cs-high
> +    - required:
> +        - spi-cpha
> +    - required:
> +        - spi-cpol
> +
> +then:
> +  required:
> +    - spi-cs-high
> +    - spi-cpha
> +    - spi-cpol

This 'if' can be better expressed as:

dependencies:
  spi-cs-high: [ spi-cpha, spi-cpol ]
  spi-cpha: [ spi-cs-high, spi-cpol ]
  spi-cpol: [ spi-cs-high, spi-cpha ]


> +
> +unevaluatedProperties: false
> +
> +examples:
> +  # I2C mode
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      rtc@32 {
> +        compatible = "epson,rx6110";
> +        reg = <0x32>;
> +      };
> +    };
> +
> +  # SPI mode
> +  - |
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      rtc@3 {
> +        compatible = "epson,rx6110";
> +        reg = <3>;
> +        spi-cs-high;
> +        spi-cpha;
> +        spi-cpol;
> +      };
> +    };
> -- 
> 2.43.0
> 
> 

