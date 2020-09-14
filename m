Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD4E268DDF
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 16:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgINOgh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 10:36:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:47676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726769AbgINOgU (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 14 Sep 2020 10:36:20 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1816620829;
        Mon, 14 Sep 2020 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600094179;
        bh=ZLRfrIrY0GfgAj/UjPD18JtlgPZAUOTDBn5blkcgKCI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o8ww2aGI5lF9+RriclIoS+lIahsQ8WBpPem5tRhK0NQogekW/29hPdpKpz5plK+dP
         a7heM5e5GuUHuAyXwemtcGgNJ9bJMCghvLrM3I5GE3OHhzxMYKzZVDdFsSBLLsGrhM
         PvQfQLnQQN0YNuxX7S4SCu4yWem1Zem9nnIzcG6s=
Received: by mail-ot1-f49.google.com with SMTP id h17so144802otr.1;
        Mon, 14 Sep 2020 07:36:19 -0700 (PDT)
X-Gm-Message-State: AOAM533VM/nnscOTTXYQM0s4l5Q46waiLyYe9oK3lf6ERnYmGPbbudE7
        NgRqYMmnfFx9p90sWezhW7thpYoIEInmYzAEzQ==
X-Google-Smtp-Source: ABdhPJzP4FgOtLW9o0tUTR6mni3ZlrLEG1YAY2KfJnpjqKCRIT/Nr0E9RbL0WFPOHxQQqjfv4+JnV3yBO2D2ZnAn24E=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr8766689otp.107.1600094178370;
 Mon, 14 Sep 2020 07:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200827091441.12972-1-qiang.zhao@nxp.com> <20200909202456.GA3019412@bogus>
 <VE1PR04MB676899EEA79D59061FE91BF691270@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <CAL_JsqJx=7npNYNe4MybNvdNRxBj_XjvEOJsSm+gNGEkvbh2VA@mail.gmail.com> <VE1PR04MB6768F9352B510CB6E873515A91230@VE1PR04MB6768.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6768F9352B510CB6E873515A91230@VE1PR04MB6768.eurprd04.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 14 Sep 2020 08:36:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJMnkt0=AKh36bCpsmkACHMoQbVyuh65NL4PXrvt4A+ag@mail.gmail.com>
Message-ID: <CAL_JsqJMnkt0=AKh36bCpsmkACHMoQbVyuh65NL4PXrvt4A+ag@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for nxp,rtc-2127.txt
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Sep 14, 2020 at 1:08 AM Qiang Zhao <qiang.zhao@nxp.com> wrote:
>
> On Fri, Sep 11, 2020 at 22:03, Rob Herring <robh@kernel.org> wrote:
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: 2020=E5=B9=B49=E6=9C=8811=E6=97=A5 22:03
> > To: Qiang Zhao <qiang.zhao@nxp.com>
> > Cc: a.zummo@towertech.it; alexandre.belloni@bootlin.com;
> > linux-rtc@vger.kernel.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
> > nxp,rtc-2127.txt
> >
> > On Wed, Sep 9, 2020 at 9:16 PM Qiang Zhao <qiang.zhao@nxp.com> wrote:
> > >
> > > On Thu, Sep 10, 2020 at 04:25AM, Rob Herring <robh@kernel.org> wrote:
> > > > -----Original Message-----
> > > > From: Rob Herring <robh@kernel.org>
> > > > Sent: 2020=E5=B9=B49=E6=9C=8810=E6=97=A5 4:25
> > > > To: Qiang Zhao <qiang.zhao@nxp.com>
> > > > Cc: a.zummo@towertech.it; alexandre.belloni@bootlin.com;
> > > > linux-rtc@vger.kernel.org; devicetree@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org
> > > > Subject: Re: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
> > > > nxp,rtc-2127.txt
> > > >
> > > > On Thu, Aug 27, 2020 at 05:14:39PM +0800, Qiang Zhao wrote:
> > > > > From: Zhao Qiang <qiang.zhao@nxp.com>
> > > > >
>
> Please help to review as below, if it is ok, I will send the new version =
patch. Thank you!
>
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Doc=
umentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> new file mode 100644
> index 0000000..809dd59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,pcf2127.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCF RTCs
> +
> +maintainers:
> +  - Qiang Zhao <qiang.zhao@nxp.com>
> +
> +allOf:
> +  - $ref: "rtc.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,pcf2127
> +      - nxp,pcf2129
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  no-watchdog:
> +    maxItems: 1

maxItems is for arrays. What's the type here? It should have a description =
too.

> +
> +  start-year: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +...
>
> >
> > Documentation/devicetree/writing-schema.rst and about 1000 examples in =
the
> > kernel tree.
> >
> > Rob
