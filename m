Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E39660E320
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Oct 2022 16:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233686AbiJZOSe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 Oct 2022 10:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234099AbiJZOSW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 Oct 2022 10:18:22 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F5010F881
        for <linux-rtc@vger.kernel.org>; Wed, 26 Oct 2022 07:18:22 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id d13so10593092qko.5
        for <linux-rtc@vger.kernel.org>; Wed, 26 Oct 2022 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YtRWJZKbMif6QKbJ+qEdydNmgiCQ/4zO/xpn20FjE4=;
        b=zdv4FwBCWn4px/ZLt6urY7kQ5Nzp174y1W9tVH1mW0ock6rV9wZBSXu9ivTdt6zbTL
         WhTDnHDBw6mAYNtI1BmdeflDYALhjHvpVldTdQOpUwhBZIaoGdCzXbY5dpeFGggOUHTk
         gXzffOzZ97i6hXQYzh94pTxhfIp9F/Db6KAkqCdRA2p66dGQ17rJw4netdD4OIdeJw7l
         rOXafc6nTCRjQyLebEIxGq9w5UK9kZFVCmfkC8lz6F0smWx2CvSh5U2Eq3RVRHPk4ceH
         DL7jADWT0VUCCapVJZ7hHRtLV3xSA/Im1YVoB4lPOkXqFBvaDiDq2+moeBa7ACD9uqMA
         cVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YtRWJZKbMif6QKbJ+qEdydNmgiCQ/4zO/xpn20FjE4=;
        b=BZDPIIws0JHeDP4N4uQC6E/wfZr6X5erZ7pJtOiYdPn7OkZRvqgf6P2lu1+kAx/eT3
         TAc85xpWWMb82PGE2eu6Lhd6+0OM5e5/WxOBzmV9rA+DOknQwBsi8kfNV/wBtWc1DuIi
         NYrqDvLbszG2TqcpTdEW02Gm0QLNZqBRA+KffazM8yTwjWv+xu9h9Q7JzV0nJo2YyHOG
         3ULUJ8fyZazxWE+7hrvHJcCG2nbsVFdJQwwE09NzsX/L5WZbq9vHB1CxWW++v/93ic1Z
         rxQVqfncUUQiraDbD7/CPfTKcyqzSw4IcUOdNk451k8rv9yACqze7TQmnvBYpgL03PQf
         gv/A==
X-Gm-Message-State: ACrzQf2EDqQS7yUrFFc9HXE4i+h3SIRio5rDIrxAc9g+ZU0vSlEiX2Fn
        fNNmn7WpRb9Jezn2YcEXv7g4NIsbxt0F4A==
X-Google-Smtp-Source: AMsMyM6764WLKyAmF+3eAYWy9F1BsXvQY4uwWjp3lRii2rrmauPtCVQKmSB/pWf5AHM85b+gdXjhGA==
X-Received: by 2002:a37:6945:0:b0:6f4:ae0f:648b with SMTP id e66-20020a376945000000b006f4ae0f648bmr11991186qkc.329.1666793901165;
        Wed, 26 Oct 2022 07:18:21 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id b14-20020ac8540e000000b00399ad646794sm3293499qtq.41.2022.10.26.07.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:18:20 -0700 (PDT)
Message-ID: <4ddf54db-69c6-69a8-5c73-6c365b9f90b3@linaro.org>
Date:   Wed, 26 Oct 2022 10:18:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/2] dt-bindings: rtc: add bindings for max313xx RTCs
Content-Language: en-US
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
References: <20221026131124.289-1-Ibrahim.Tilki@analog.com>
 <20221026131124.289-3-Ibrahim.Tilki@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026131124.289-3-Ibrahim.Tilki@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/10/2022 09:11, Ibrahim Tilki wrote:
> Devicetree binding documentation for Analog Devices MAX313XX RTCs

Drop second "bindings for" from the subject, it's redundant.

> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> Signed-off-by: Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

