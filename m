Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CEB3379A2
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Mar 2021 17:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhCKQlS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Mar 2021 11:41:18 -0500
Received: from mail-io1-f45.google.com ([209.85.166.45]:36385 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbhCKQlR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Mar 2021 11:41:17 -0500
Received: by mail-io1-f45.google.com with SMTP id n14so22623223iog.3;
        Thu, 11 Mar 2021 08:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=U7jzm/CFG4Ylm4v8voBfCMU+CxkY3bE8NKg4UeAuxbQ=;
        b=CJuO0VNQHqSZfWQzgCHyrOHoPkj2utBJ2dA22/3cKyNU866g0/v3PqXAFxG4xH6LTh
         /am0DTOgkfqpKFC+psKOIwzwp/cJsIIS7/ayJ1wqePdpHlLPQ0GokqFfYnsFafTH9mJn
         sJ3UvNPpyJRE7oyHkSTgUJE66Fr0QIfiVcdfzUYkn4sb+nbPwCCg8jujOiR3jta2fImh
         z6rWkmcbSVfoQQtkcpDrv3Jklntqh2L5+FozOIVazMeGV+ACQjS95M7thKkf76yl9K+B
         i39NqR4OJRT3oUfEH4ptyhpjZRmPk82HdhGGBHb/n/Le+ENnJ7oyY3IHrO5zsUacZcAl
         GJbA==
X-Gm-Message-State: AOAM531o4Vseuk+ysRIkW6eLTbCtqYjOc0Di6rUhwkbTGQYVoRk3C51s
        9/SatcmZZ39eTY8TZn3uPA==
X-Google-Smtp-Source: ABdhPJxbaDM4XI8ZWhFC1q8ZH6bP9IzTuINR+19AO6I/yVBlCCKLU9oTvGO8Q+5z803ksGP47PsfAQ==
X-Received: by 2002:a05:6602:228f:: with SMTP id d15mr6509757iod.141.1615480876875;
        Thu, 11 Mar 2021 08:41:16 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u14sm1471024ilv.0.2021.03.11.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 08:41:14 -0800 (PST)
Received: (nullmailer pid 841933 invoked by uid 1000);
        Thu, 11 Mar 2021 16:41:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, kgunda@codeaurora.org,
        Alessandro Zummo <a.zummo@towertech.it>
In-Reply-To: <1615447798-6959-3-git-send-email-skakit@codeaurora.org>
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org> <1615447798-6959-3-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Date:   Thu, 11 Mar 2021 09:41:02 -0700
Message-Id: <1615480862.528721.841932.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 11 Mar 2021 12:59:57 +0530, satya priya wrote:
> Convert pm8xxx rtc bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        |  99 -------------------
>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       | 108 +++++++++++++++++++++
>  2 files changed, 108 insertions(+), 99 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:27:6: [warning] wrong indentation: expected 4 but found 5 (indentation)
./Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:30:6: [warning] wrong indentation: expected 4 but found 5 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1450975

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

