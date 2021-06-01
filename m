Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F869397447
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Jun 2021 15:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbhFANeC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Jun 2021 09:34:02 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:45651 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234072AbhFANd7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 1 Jun 2021 09:33:59 -0400
Received: by mail-ot1-f47.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so14085599otc.12;
        Tue, 01 Jun 2021 06:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=IF8cURsxp/nq12oY6C7u3w5i8JCScdi+M9TktNMYd80=;
        b=Xn9EHlsLo2pczsM3o56zKgfezj17w41zJwEWMLFJ0kcAruPBT8Ek+cQIQgplMaRy+1
         yiOjTFtUREC3R0kT4Jy68Py52pGrrI7R9pyCjeVup5SJ+nuQW/DWAuqV/Q+H4T22Dk9V
         e+CC96knU/7RpSq5XgWhkkCgyBTgMsdc0Wjqg+VnSGCm6gK4rY+dH80FJ6JadLkhZ4Km
         eG8M4G2B+4k8HtyUpmwj7owMLBsRAXxm5KSt6hQc8H/E/oVq4YcmW+IcqIdDoQpyPq/I
         t9oGL4NwBLv1IxKuLRSTo9+7Rulv3ccoWwUZ5iOYpD884zEUqGb8+3VWVnZcJenQqaRE
         NMhg==
X-Gm-Message-State: AOAM533ewaPn74M7vzkMV5+WDqsrORgZJ9K0NaVF3gcK7aq5WkIWYUEd
        OD/zS6Su2FKrTDEOstyc5wC+y+MljQ==
X-Google-Smtp-Source: ABdhPJz4xciBUKg1F9JwW4F2bxxsL5pPZ0AN6DWxHNCVLbAW4YpRKYkvBjAvTiiEBQvMSROtatt/yg==
X-Received: by 2002:a9d:4801:: with SMTP id c1mr12072880otf.278.1622554337277;
        Tue, 01 Jun 2021 06:32:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm3423981oie.32.2021.06.01.06.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:32:15 -0700 (PDT)
Received: (nullmailer pid 242365 invoked by uid 1000);
        Tue, 01 Jun 2021 13:32:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20210531052426.695576-1-iwamatsu@nigauri.org>
References: <20210531052426.695576-1-iwamatsu@nigauri.org>
Subject: Re: [PATCH] dt-bindings: rtc: zynqmp: convert bindings to YAML
Date:   Tue, 01 Jun 2021 08:32:10 -0500
Message-Id: <1622554330.044320.242364.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 31 May 2021 14:24:26 +0900, Nobuhiro Iwamatsu wrote:
> Convert Real Time Clock for Xilinx Zynq MPSoC SoC bindings documentation
> to YAML schemas.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  .../bindings/rtc/xlnx,zynqmp-rtc.yaml         | 58 +++++++++++++++++++
>  .../devicetree/bindings/rtc/xlnx-rtc.txt      | 25 --------
>  2 files changed, 58 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/xlnx-rtc.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.example.dts:16.9-30: ERROR (duplicate_property_names): /example-0:#address-cells: Duplicate property name
Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.example.dts:17.9-27: ERROR (duplicate_property_names): /example-0:#size-cells: Duplicate property name
ERROR: Input tree has errors, aborting (use -f to force output)
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.example.dt.yaml] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1485555

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

