Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9396FD79D
	for <lists+linux-rtc@lfdr.de>; Wed, 10 May 2023 08:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236277AbjEJG6b (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 May 2023 02:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbjEJG62 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 May 2023 02:58:28 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EDA5FF1
        for <linux-rtc@vger.kernel.org>; Tue,  9 May 2023 23:58:05 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso12619105a12.3
        for <linux-rtc@vger.kernel.org>; Tue, 09 May 2023 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683701884; x=1686293884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7jXocIwYPIGzvhOiRzDQAjWhw+CE4Ka5TJvB78q5ew=;
        b=lk0nB503RUcCn2A04bvqpU9X2MrDHSSHBqrt4SeX+Jc72AYHkiGUiezcuZbNiWI4uh
         C8i6z5z1v64htX+RGmj/occVpIEc/AKU6wYSkDAmsk+he+lJ4Rm9cdnLaxQ6K0DXqh6r
         FvLh5zizhBy4aPjHWDR8cz1413ZNfPpWYwYCMqPyYIuDo0Y3QM3EsRFzctyjlC5ulRbf
         L+X+qFAYuaHYiNZc8g0bsTmrhz8gepwTWYXfrY8NYljyMJJmcToZBW88Ma23p+BZKqPH
         w2m7DynTpIahwXvfbpD8e6OXBiob9pow+vLekC95ZTu/OLQCcNLnSlHYfn6p4OOu2fXP
         0buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683701884; x=1686293884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7jXocIwYPIGzvhOiRzDQAjWhw+CE4Ka5TJvB78q5ew=;
        b=b0pGob4s9XFrSnOP180rjbvYKCbn60AFWt0hBRKbKObc8b5BRn0P0bpS78iIDKpwhE
         v7wDVCfUAL9MxGCJEjztQoV2OimhHrgoFFJYbcAUjmr4qrhLlix1u45Lo0SMuFyPiZPa
         H6o12KAV9Ga5/Ic7yHiuhqKiEniX9BCjJ+P0At7QGW5U+sSzcjzET/uU9Qw6n5yBZtuS
         fTCYxUxL7BVFofAW3FFIPLAf9Yw7dsR9lxsNhLOiKzpWa9CAiogzVDD0uQxtyh1qkXF3
         2RQfZyJpKbqV5qv5C/0lC1ptT3VbV9vsItWt7iQG2BFAyn8MzuBB1WPu7i0o6fjNjUR2
         f3dA==
X-Gm-Message-State: AC+VfDwNybwlmQL5NPvHj84R8olj9Rf4XqjwaUD+/rK3/AtWE1xpAIoH
        NcbUd07q23UdcCUS+BGl68Xrmg==
X-Google-Smtp-Source: ACHHUZ4viiJ0HXKI6HHrPl96hozH38DnYXdgeLQLnyiM39OKQPIL8euG/Y8yd8n5k8wScPzTI0jc8g==
X-Received: by 2002:a17:906:7310:b0:94a:a419:f382 with SMTP id di16-20020a170906731000b0094aa419f382mr15563263ejc.12.1683701883986;
        Tue, 09 May 2023 23:58:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id de25-20020a1709069bd900b0096664376ec9sm2294419ejc.55.2023.05.09.23.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 23:58:03 -0700 (PDT)
Message-ID: <0620e3ef-ece5-550a-43bb-0d6e75de79bf@linaro.org>
Date:   Wed, 10 May 2023 08:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4] dt-bindings: rtc: isl1208: Convert to json-schema
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Trent Piepho <tpiepho@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230509131249.80456-1-biju.das.jz@bp.renesas.com>
 <CA+7tXig2nwCk3DKwFEKGKVko=YD4e4KCpRVUMMM2pgPRpNgiiQ@mail.gmail.com>
 <CAMuHMdUOdJrPdcx684zKaSNFMqkRWL_y3jdAor_D0AeDRpRhJQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdUOdJrPdcx684zKaSNFMqkRWL_y3jdAor_D0AeDRpRhJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/05/2023 08:52, Geert Uytterhoeven wrote:
> Hi Trent,
> 
> On Tue, May 9, 2023 at 9:03 PM Trent Piepho <tpiepho@gmail.com> wrote:
>> On Tue, May 9, 2023 at 6:12 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>> +
>>> +  interrupt-names:
>>
>> Shouldn't this have minItems: 1 and maxItems: 2 as well?
> 
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 2
>>> +    else:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 1
>>
>> Add interrupt-names here too.
> 
> Isn't the relation interrupts <=> interrupt-names enforced by the
> tooling?

No, every constrain or schema code for one should be duplicated for
second. These can be done however in different ways, e.g.
interrupts:
  minItems: 1
  maxitems: 2
interrupt-names:
  minItems: 1
  items:
    - foo
    - bar

but the outcome - so how many items are expected - must be the same in
every branch/condition.

Best regards,
Krzysztof

