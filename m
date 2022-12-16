Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7550364F262
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Dec 2022 21:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbiLPUbW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Dec 2022 15:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbiLPUbP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Dec 2022 15:31:15 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233F64D5F9;
        Fri, 16 Dec 2022 12:31:13 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2441084FF0;
        Fri, 16 Dec 2022 21:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1671222670;
        bh=qjUGVjST7RgTBHAYkVuGV4SN7cxpCPjkD1CWKB4WS9s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LJhFtKVMDg8AUuUcxlrQwjPd3tROaqruC5cUSSsaAFQdRsRVdEMlD7pxxmOHcNZ5+
         OQEABdP28OlXIvYAEgx7u3eShD863mwRN8mlctSt8ucvGXhQV7Yx9c18X3bIYrWxH1
         MOba+EDfV48TFu6ofzljWkNBJNPRk/q0CmlIlZ/OYWpysMSBBO29nc/sjb39Z2Lhbc
         j+UjLw+zODxJYgB9Uo4tZzp97RKkda332+CeWlzq/3Z0rAk5pbHK63RXi9018/D8Mv
         8tmGJIDXpCuCqO9ToSgm99bgUwe7Pu/W4Bx/3hc4/xfpfei6KGW0cg2RSZpYZzt47J
         gjzI0YsANPUVg==
Message-ID: <781e3e0f-bcfd-4165-d65a-08d4eb6ddeb7@denx.de>
Date:   Fri, 16 Dec 2022 21:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 2/2] dt-bindings: rtc: m41t80: Mark the clock: subnode
 as deprecated
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
References: <20221211205124.23823-1-marex@denx.de>
 <20221211205124.23823-2-marex@denx.de>
 <20221215180659.sa54lkinwxoiz7bb@mercury.elektranox.org>
 <d9910a7a-9997-c157-9a71-8ef7ee34be25@denx.de>
 <20221216142408.6x3e5dhtdvgiewtb@mercury.elektranox.org>
 <f65773a2-71a7-6d54-1ac2-9987ed035b16@denx.de>
 <20221216150548.dttzfmdbqzk6r42z@mercury.elektranox.org>
 <Y5ybrlxIH4zYpaWZ@mail.local>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Y5ybrlxIH4zYpaWZ@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/16/22 17:24, Alexandre Belloni wrote:
> On 16/12/2022 16:05:48+0100, Sebastian Reichel wrote:
>>>> IIRC On i.MX6 referencing the I2C connected RTC results in boot
>>>> hanging forever when trying to get the ckil clock in
>>>> imx6q_clocks_init. At least it used to be the case when I was
>>>> working on this - I no longer have access to the boards. Of course
>>>> properly referencing the RTC clock was the first route I tried.
>>>
>>> Hmmmmm, what shall we do, un-deprecate the clock sub-node?
>>
>> Depends on the exact meaning of "deprecate: true". I think we all
>> agree, that it's better to avoid the sub-node and only use it when
>> it's really required. But having a deprecation warning for an
>> in-tree user without a clear path forward also seems to be annoying.
>> I think it makes sense for the DT binding maintainers (Rob/Krzysztof)
>> to comment on this.
>>
> 
> I dropped the commit from the PR I'm going to send Linus later today

That works, thank you !
