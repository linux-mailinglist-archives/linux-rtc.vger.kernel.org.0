Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4B05802A0
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Jul 2022 18:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236027AbiGYQ0Q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jul 2022 12:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235827AbiGYQ0P (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jul 2022 12:26:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774D11C93D
        for <linux-rtc@vger.kernel.org>; Mon, 25 Jul 2022 09:26:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z25so18926736lfr.2
        for <linux-rtc@vger.kernel.org>; Mon, 25 Jul 2022 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4T+PbyHM+wfLYl65UslDGXMXntturk9NYcTl2mpNuw4=;
        b=J1Id9hOvX/4PicOieafgx3YXjugYQ+C1JHlqE7GBdQkHoOv2a0rezvL6Ix8UHLi/kR
         40qMVOZ2dAAJzvyMFB4ehO3IKUDqedyMAftY4wnPCyogwEnsDbJq1I66QLu7tPlUSfnZ
         9sEwZY89EcaKnqUBnrXXZ/xIsOnFIvYvFkX+wGFfLe+8rCGobMtAGIjlK4KaP3a/+Vue
         NruVlosIyI0rGCW/2Oy7BC+nUSSAae8YOseQRzup0U8WFrLS4wLiLASTGNT0KV55d+dU
         XSLGtRQ0EiWH3FhyXQcs/s5R2+N4zmGpujP2mEhfsQe1dKBDkwWdhl6ZQFjsTEbySQcW
         F2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4T+PbyHM+wfLYl65UslDGXMXntturk9NYcTl2mpNuw4=;
        b=Fcplen6Zn2c9wnYP6vXcWon+OK0KiO6z1m3Jk9yITiwk0965oYozaA0rAR+fjwsrXR
         oqOlI8dFa78mOOnGsczl2D69pSWIZ2FNb6alstAIVv0OlPjxp+FWljqpMB19ytVTFAuV
         Pdu0quGtVi7BJA9842v4CwA5viOL6HCDcrwYwT4PfwRb6dgSIvFBn8vAemHeKKqub32D
         K47Q8a1/0rMfbQEP+dsPk+h6U1VxUNxCfaa3QudQMGiFZSB7acXQtVS+SKHAQwtFtV16
         OzJHi1pWYut5/O74mGKFjBuMukc2dsH2hTUt+WWOsj4cXu30quX1ydGF99mDtztq0NHy
         32gw==
X-Gm-Message-State: AJIora8ROElLIOhJwybyn7+jGae4QpScXSX5GMcbqP/Fm7IX6ugCJc3G
        rSP6bZHE6BfzTygpO3W37huk8w==
X-Google-Smtp-Source: AGRyM1urdUV3F43axjGYiO0+LpThUaQdCfH0uBGEDq3XRS3hIn1yofWjeUrjT/CDPws3EkB/DCAssA==
X-Received: by 2002:a05:6512:1310:b0:481:6154:c292 with SMTP id x16-20020a056512131000b004816154c292mr4696089lfu.95.1658766372821;
        Mon, 25 Jul 2022 09:26:12 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id b9-20020a0565120b8900b0048a950050ebsm352917lfv.28.2022.07.25.09.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:26:12 -0700 (PDT)
Message-ID: <515453c6-eaa4-d09b-6ce6-3840b350dcbb@linaro.org>
Date:   Mon, 25 Jul 2022 18:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/1] dt-bindings: rtc: nxp,pcf85063: Convert to DT
 schema
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
References: <20220725071919.25342-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220725071919.25342-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 25/07/2022 09:19, Alexander Stein wrote:
> Convert the NXP PCF85063 RTC binding to DT schema format.
> 
> Add 'interrupts' and 'wakeup-source' as this device has an interrupt
> which was not documented, but is in use.
> 'clock-output-names' and '#clock-cells' are added as well, those were
> probably missed when adding clkout support in commit 8c229ab6048b
> ("rtc: pcf85063: Add pcf85063 clkout control to common clock framework")
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
