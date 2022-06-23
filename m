Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 385525575D1
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Jun 2022 10:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbiFWIq2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Jun 2022 04:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiFWIq1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 23 Jun 2022 04:46:27 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4DF49263
        for <linux-rtc@vger.kernel.org>; Thu, 23 Jun 2022 01:46:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v14so26903968wra.5
        for <linux-rtc@vger.kernel.org>; Thu, 23 Jun 2022 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UGrqHxQj/5j/zHmIDUYbiInrY/NFAKrj6sAi+yapJQY=;
        b=YTb9UJg18mD6nlATTJ/pR+CP5U2/nG6InCer8s8rLNbwmfieb9W+D7kc2yklxUMhoy
         ZnJ0ZcMXt+iIgGgToToQjEcr+Lyvb8ZxcVTu4f6FjY71dUeR4LMM8SEWnsy8V/yxPsH/
         CRSrEaOsWv+yyGJh6i42oxPQ0/F/nVUJZPi66U/O9Rofkvv7ALSoqnhYal2nQLgKianH
         1lZ1JLJHFwbWUMEzvTrQYPvdJ8jdc98bNKbU7KkNhMYl7LZFh5/e71namva3MCN3+W/y
         /vsCWqiVIV9GVD+jSC7nd7F7M2DwA6VboY9f2oZANViZlPyrsVErysf7/HgxM47mC25f
         UL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UGrqHxQj/5j/zHmIDUYbiInrY/NFAKrj6sAi+yapJQY=;
        b=m03e4yDptTz88RGSSFeLDnHkd0TZKthYRznv7YnwFl+71pi35JcifRMDHUEJxZVK6x
         VNxKnuc95xQk64Q6FkS0xB9blEiUki3Q71ng5zjaNSHmDp8gwWiv7sP7qfhFVS54ew3z
         xbaRJCjjEUFH/CtVvtw5GJLfBDkIBcGMYzJuvxJU0GGqMSP3TeQvsoK40eeQjAK9Ec+Q
         eLCzIqZFyhAq/TUNvxYEFRL+nHKWtgWQSAvSCZYNAuQb5gb/x7c8FwYIqxqZQ5j7jeN8
         Y3OVVqif77RAAC+9up5eG+SXDFKVdUHOhjoewZwZGqflddCKPN1F9o4Y9f/VGvowTKC5
         kC8w==
X-Gm-Message-State: AJIora+ldbhq+63DoEGURVlbwDsLHx8/yupxoPEa0loVtHZVdZMMLSUM
        OaOqzHQxkAhDCrt2ArE8kJ1k8w==
X-Google-Smtp-Source: AGRyM1vWo2ylb1ofUrjGIyzVMpGruCBwmJOGcb2R+QuYFRREajNqmhbrPfjBur3DpG/N5jJQKyZIBA==
X-Received: by 2002:a5d:5951:0:b0:21b:9480:1696 with SMTP id e17-20020a5d5951000000b0021b94801696mr7404229wri.350.1655973985501;
        Thu, 23 Jun 2022 01:46:25 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id h4-20020a5d6e04000000b0020d02262664sm21562852wrz.25.2022.06.23.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 01:46:25 -0700 (PDT)
Date:   Thu, 23 Jun 2022 09:46:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        quic_tsoni@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom-pm8xxx: Update the
 maintainers section
Message-ID: <YrQoX2tlxtf0B8B8@google.com>
References: <1655874639-11273-1-git-send-email-quic_c_skakit@quicinc.com>
 <1655874639-11273-2-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1655874639-11273-2-git-send-email-quic_c_skakit@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 22 Jun 2022, Satya Priya wrote:

> Update the maintainers section with latest mail ID.
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
