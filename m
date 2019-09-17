Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30EDBB4EA5
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2019 15:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfIQNAs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Sep 2019 09:00:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:49348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfIQNAs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 17 Sep 2019 09:00:48 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 868212171F;
        Tue, 17 Sep 2019 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568725246;
        bh=X4jhLlVfIWPwWC9KTpr/8HXl1E17S2vkdaVA4OMT1kY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w23Lq/oJU+s6apUIRVuiK+YDX/N1xhNqJQlDdyNSTIIS4llYBBHacGEQ4aqAxGUuj
         swxkGkjJb55MoIUleuTHruTOzw4PJ6ScUbiB8dK8dThqn73CtcAfz7yYD6OC1CjiEe
         SgQHfXKUW6kyRCfP9dgas9zlDtsMiCLVoEctYW10=
Received: by mail-qk1-f182.google.com with SMTP id y144so3853163qkb.7;
        Tue, 17 Sep 2019 06:00:46 -0700 (PDT)
X-Gm-Message-State: APjAAAX/xkEYXtg7QKUDjwjEkBtso4SZ9vUr0nHUSxdDBRDcOZFpFkkJ
        u7abdOBnPiwyP+Uf9sKG1nzUVvD/kV8fww7gZQ==
X-Google-Smtp-Source: APXvYqwdHDSINgFsGh7pd2VEEZGaLj8zK4i6nJuMiwayyOSSoGvfQtn7Pl9ax/5kobBzpP58bbURF5hI6SMlAzFUqBc=
X-Received: by 2002:a37:be87:: with SMTP id o129mr3660621qkf.254.1568725245764;
 Tue, 17 Sep 2019 06:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190917083634.11510-1-horms+renesas@verge.net.au>
In-Reply-To: <20190917083634.11510-1-horms+renesas@verge.net.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 17 Sep 2019 08:00:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLCYp8nmvoHtCNcLDKOKJ1bmL5FxQPwSREBLSy2-fZ=Vg@mail.gmail.com>
Message-ID: <CAL_JsqLCYp8nmvoHtCNcLDKOKJ1bmL5FxQPwSREBLSy2-fZ=Vg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: rtc-sh: convert bindings to json-schema
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Sep 17, 2019 at 3:37 AM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> Convert Real Time Clock for Renesas SH and ARM SoCs bindings documentation
> to json-schema.  Also name bindings documentation file according to the
> compat string being documented.
>
> Also correct syntax error in interrupts field in example.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Based on v5.3
> * Tested using:
>   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
>   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> ---
>  .../devicetree/bindings/rtc/renesas,sh-rtc.yaml    | 66 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/rtc/rtc-sh.txt   | 28 ---------
>  2 files changed, 66 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt
>
> diff --git a/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
> new file mode 100644
> index 000000000000..07dbcd4436ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/renesas,sh-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock for Renesas SH and ARM SoCs
> +
> +maintainers:
> +  - Chris Brandt <chris.brandt@renesas.com>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r7s72100-rtc  # RZ/A1H
> +      - const: renesas,sh-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: alarm
> +      - const: period
> +      - const: carry
> +
> +  clocks:
> +    # The functional clock source for the RTC controller must be listed
> +    # first (if it exists). Additionally, potential clock counting sources
> +    # are to be listed.
> +    true

Surely you can give some range...

> +
> +  clock-names:
> +    # The functional clock must be labeled as "fck". Other clocks
> +    # may be named in accordance to the SoC hardware manuals.
> +    true

While not ideal, you can do:

minItems: 1
maxItems: 4
items:
  enum: [ set, of, possible, clock, names, in, any, order ]

Note 'items' here is a schema, not a list.

Your dt-schema install may need updating as I only recently adjusted
the meta-schema to allow this.

Rob
