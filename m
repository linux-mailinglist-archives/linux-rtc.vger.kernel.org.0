Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 739F1618510
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Nov 2022 17:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbiKCQrP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Nov 2022 12:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbiKCQq5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Nov 2022 12:46:57 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A0822B32;
        Thu,  3 Nov 2022 09:44:03 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2C07385183;
        Thu,  3 Nov 2022 17:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667493841;
        bh=QST4LK774pDdg37jwZflAjVWkOd+5exu2du+u5wwcJ8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aF/811f3xgirHYofDVippEhyMOPR3AA9VD0o+AEXXHIVNx4SBleJXds2GoARnD7q0
         0ElMeQI4OPaXNbahwwpfsc4tadFowcX2267eqTv6KAAEm4vyo79/baDi53ie401KZ8
         NKPt7QS0NvuBgHHxDLU9X7pb/a7KdBIwX99CM1Uxay+sqd4GHPR/+KSaYQZkJlYGnp
         OIEDadSgDMcV9hcmXxTtgtM2OGzmX8q0c+pqnzuyNktLK7Ooc8to5ukTg4Sn1gdyyy
         8gAURznVU3BHZccoWMmsEJPDXJz+EWMB9aFNCROT52BK0+7pErmaZqps0LCHRHPErO
         I1nYC0IL6/oEQ==
Message-ID: <b34ba792-ba15-14fd-9f1d-7b45c7ae3d39@denx.de>
Date:   Thu, 3 Nov 2022 17:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] dt-bindings: rtc: m41t80: Convert text schema to YAML
 one
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
References: <20221102225943.157344-1-marex@denx.de>
 <abbccd73-7e49-b70b-d552-c1ff9426ea8c@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <abbccd73-7e49-b70b-d552-c1ff9426ea8c@linaro.org>
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

On 11/3/22 14:40, Krzysztof Kozlowski wrote:

[...]

>> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml b/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml
>> new file mode 100644
>> index 0000000000000..7f31a22caec9b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml
> 
> Filename based on compatibles (more or less), so could be:
> st,m41t80.yaml
> or:
> st,m41txx.yaml
> 
> The "rtc" name can be skipped as it is implied from subsystem folder,
> unless st,m41txx is a name of some SoC?

[...]

>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#clock-cells":
>> +    const: 1
> 
> Hm, why do you have it?

Because of the following warning:

$ make dt_binding_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml
   LINT    Documentation/devicetree/bindings
   DTEX    Documentation/devicetree/bindings/rtc/rtc-m41t80.example.dts
   CHKDT   Documentation/devicetree/bindings/processed-schema.json
Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml: properties: 
'#clock-cells' is a dependency of 'clock-output-names'

>> +
>> +  clock-output-names:
>> +    description: From common clock binding to override the default output clock name.
> 
> You need maxItems

Done

>> +
>> +  wakeup-source:
>> +    description: Enables wake up of host system on alarm.
> 
> Skip the property - it comes from rtc.yaml.

Done
