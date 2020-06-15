Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12DE1F9D12
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2020 18:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbgFOQUh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Jun 2020 12:20:37 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36481 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729637AbgFOQUg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Jun 2020 12:20:36 -0400
Received: by mail-io1-f68.google.com with SMTP id r77so18541349ior.3;
        Mon, 15 Jun 2020 09:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gxWgc+Codkhf0VRTT86CbanEtJCVNSbZuWqCjWmeC4k=;
        b=cohofqmQyrdNax3MbFOxOSIJA/LAuWDodYljjR9dilP9MOQcuk+3ybbWamAD2Z5rtx
         g58mRih4n4O/CDkghRdaAxY5p3++WgchJ80/DfFlp4oBsGC/UJeos2E/39pjF+0Yp//8
         KK32nCUQSeNUiUQhU+rrb1PP1r42KQi6Lsl2clYm4JU4nnqSmn0Ow2otTG2gYOEcMWE5
         V+RzL0lBkqZ7AhmUqmsvG/M+N+jHtVK4+ttWPwKGjdvLhPTFPrkiN4KgDCDTOabmEbvY
         ggUiMF+9fyN7Ym6YY/dEn+0CzZawurqwEXzF9lbBgBAc/q5t//Uhk4odJaV0/ubpmNrF
         sCbA==
X-Gm-Message-State: AOAM532wdg4Ia0mC86T8B6XE9r5z8zI+YArmZwYP9DUer3qxiKsCUQwV
        pIaQpTZ8oVCxdQcAxNQ+uNkpLqE=
X-Google-Smtp-Source: ABdhPJyia2YjUz7sBsHEEWOJHc1dA8yDt4856foCcXRteTZJaWf6MJkxsoQZ6sa16kBdtpwlIRQRZg==
X-Received: by 2002:a05:6602:34f:: with SMTP id w15mr27863770iou.2.1592238034919;
        Mon, 15 Jun 2020 09:20:34 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id t63sm8493653ill.54.2020.06.15.09.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 09:20:34 -0700 (PDT)
Received: (nullmailer pid 1885290 invoked by uid 1000);
        Mon, 15 Jun 2020 16:20:33 -0000
Date:   Mon, 15 Jun 2020 10:20:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     festevam@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
        stigge@antcom.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        a.zummo@towertech.it, Linux-imx@nxp.com,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH V2] dt-bindings: rtc: Convert imxdi rtc to json-schema
Message-ID: <20200615162033.GA1885237@bogus>
References: <1591234555-15187-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591234555-15187-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 04 Jun 2020 09:35:55 +0800, Anson Huang wrote:
> Convert the i.MXDI RTC binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- add "additionalProperties: false".
> ---
>  .../devicetree/bindings/rtc/imxdi-rtc.txt          | 20 ----------
>  .../devicetree/bindings/rtc/imxdi-rtc.yaml         | 44 ++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml
> 

Applied, thanks!
