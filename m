Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76F73FCD6B
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Aug 2021 21:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238061AbhHaTFi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 31 Aug 2021 15:05:38 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:43828 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238068AbhHaTFh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 31 Aug 2021 15:05:37 -0400
Received: by mail-ot1-f44.google.com with SMTP id x10-20020a056830408a00b004f26cead745so368889ott.10;
        Tue, 31 Aug 2021 12:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W9w1w21DdRbVUz09+7iwKeSrHli8LROFhuhLFNVX38M=;
        b=epVWniu5duu6pAbIWqB6xjR8KTHHe7XwjfVcXPYp6Ll4mes9WNJ1lAMB/hWUVCfTD6
         kv2ubMDPbnoE/SoJbYebkZhK5iL2uhT0jnWxPcb1XigygIauFcDNoI6tdOpfCLhwlYB1
         lvujwL9MgtGPR25WNLGquqroSJ2qd/fdUm6gT9ccZJNFNUwB3lpdNJC/5oTqJJwR7l5Q
         StL7f+lykoFUDFo2ig09pwmmYYweFi5ksg5nWjsCfD9X4SALm120IGzrvIee+FqvW7VL
         LXc+d8AK2J/Du1GNm7RstrmbHqoKkTlTKfetU+tQQj1SzbMUi0zl0cW+ztN7q4RmhRYv
         84Tw==
X-Gm-Message-State: AOAM531pSZoMqRo6bT2zLrImsp7cjlAcLXazDl3Xl25Msl/JMZi09Fm7
        oZdPVJ4QkzyIxZikZ6JDg9VgMyVc+g==
X-Google-Smtp-Source: ABdhPJxJkz8PhGJXTQPrVysULkUbmCcCV2OdMO4amhKVmn2i6gpD5xCi+1Pi0q54u82Oa1Y2Bbb43w==
X-Received: by 2002:a9d:65da:: with SMTP id z26mr25112974oth.303.1630436681918;
        Tue, 31 Aug 2021 12:04:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k24sm4038647otp.31.2021.08.31.12.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 12:04:41 -0700 (PDT)
Received: (nullmailer pid 482100 invoked by uid 1000);
        Tue, 31 Aug 2021 19:04:40 -0000
Date:   Tue, 31 Aug 2021 14:04:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Navin Sankar Velliangiri <navin@linumiz.com>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Subject: Re: [PATCH] rtc: bq32000: Add TI BQ32002 compatible
Message-ID: <YS59SDh1/mkpBpEJ@robh.at.kernel.org>
References: <20210831074922.273809-1-navin@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831074922.273809-1-navin@linumiz.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Aug 31, 2021 at 01:19:22PM +0530, Navin Sankar Velliangiri wrote:
> The TI BQ32002 is software compatible with the TI BQ32000,
> add DT compatible entries
> 
> Signed-off-by: Navin Sankar Velliangiri <navin@linumiz.com>
> ---
>  Documentation/devicetree/bindings/rtc/ti,bq32000.yaml | 11 +++++++++++
>  drivers/rtc/rtc-bq32k.c                               |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
> index bf9c1c4ddb7e..2ddf1cc097d8 100644
> --- a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
> +++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
> @@ -15,6 +15,7 @@ allOf:
>  properties:
>    compatible:
>      const: ti,bq32000
> +    const: ti,bq32002

'enum' is what you want here.

>  
>    reg:
>      const: 0x68
> @@ -35,6 +36,16 @@ required:
>  
>  additionalProperties: false
>  
> +if:
> +  properties:
> +     compatible:
> +       items:

Use 'contains'

> +         - const: ti,bq32002
> +then:
> +  properties:
> +    trickle-resistor-ohms: false
> +    trickle-diode-disable: false
> +
>  examples:
>    - |
>      i2c {
> diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
> index 2235c968842d..a167a6afdc7e 100644
> --- a/drivers/rtc/rtc-bq32k.c
> +++ b/drivers/rtc/rtc-bq32k.c
> @@ -307,12 +307,14 @@ static int bq32k_remove(struct i2c_client *client)
>  
>  static const struct i2c_device_id bq32k_id[] = {
>  	{ "bq32000", 0 },
> +	{ "bq32002", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, bq32k_id);
>  
>  static const __maybe_unused struct of_device_id bq32k_of_match[] = {
>  	{ .compatible = "ti,bq32000" },
> +	{ .compatible = "ti,bq32002" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, bq32k_of_match);
> -- 
> 2.32.0
> 
> 
