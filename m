Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3922568173C
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Jan 2023 18:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbjA3RJX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Jan 2023 12:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjA3RJW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Jan 2023 12:09:22 -0500
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5593B3FF2B;
        Mon, 30 Jan 2023 09:09:22 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id k91-20020a9d19e4000000b0068bca1294aaso1581778otk.8;
        Mon, 30 Jan 2023 09:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLP90Evg68dqE7RCwY4yV3xX4Fwp1YhDcXOoeu59D7A=;
        b=iYaAti27moFerUyelz8WGnfdXtXmYtCJOZb8mX45adJHk8Vc4cxjzdHKJnVHHOc2TJ
         O/ULoLduyIc+pnmEcCxf6urQ4CSXLw0kmZF3Ql+5MJf1hdqDtmLDb6Ostr2YXHvNCTuF
         dSGlK2+AGfyLh3vlMotoy+vFNyQ64tO8eqeFsXv2qZaaj8yBy6P8MQlR6WSF8tnFznsy
         y4uJybCy6FHB3KJiFCRU4nUKsPez6zWM3mh0SmvvBd5gKY9CgzjjMwz+qzvFrALA6z3T
         ML4yjDxmh8G7BS/ihRdZxpROgCfSVQeZginrD4zTHsNXunUlC4WrcD1RCWweKlUE6USa
         1QbA==
X-Gm-Message-State: AO0yUKXGG3pCaWPygRblQc5+8zhMf3V2nRsYYAKlKx9PhQS92+DU+LIl
        ovWI5FLEq3pMwbEd9ztTuAjeqpVe+A==
X-Google-Smtp-Source: AK7set9PGL+jEBekhISIqkh5ljEQGgPzFLULCfmKB679JOMJ1IrE1SYdXIg/qMoMZUrgDhmNQ6pcuA==
X-Received: by 2002:a9d:148:0:b0:68b:bbaf:a299 with SMTP id 66-20020a9d0148000000b0068bbbafa299mr5152465otu.29.1675098561554;
        Mon, 30 Jan 2023 09:09:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j24-20020a9d7698000000b0068bb6043362sm3855938otl.11.2023.01.30.09.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 09:09:21 -0800 (PST)
Received: (nullmailer pid 2850409 invoked by uid 1000);
        Mon, 30 Jan 2023 17:09:20 -0000
Date:   Mon, 30 Jan 2023 11:09:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] dt-bindings: rtc: Convert Amlogic Meson vrtc
 controller binding
Message-ID: <167509855924.2850119.8228590011406676486.robh@kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Wed, 25 Jan 2023 23:24:24 +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson vrtc controller binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - improve title and commit message
> - remove bus part from example
> ---
>  .../bindings/rtc/amlogic,meson-vrtc.yaml      | 44 +++++++++++++++++++
>  .../bindings/rtc/rtc-meson-vrtc.txt           | 22 ----------
>  2 files changed, 44 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
