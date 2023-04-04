Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02DF96D5A83
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Apr 2023 10:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbjDDIOj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Apr 2023 04:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234062AbjDDIOi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Apr 2023 04:14:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E186F1BD4
        for <linux-rtc@vger.kernel.org>; Tue,  4 Apr 2023 01:14:35 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id ew6so127068548edb.7
        for <linux-rtc@vger.kernel.org>; Tue, 04 Apr 2023 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680596074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sl7VVFpi43Dv/CruzkWtwl78mBZkfE/sbR0q5Xjw14=;
        b=ke3PWGnD8ghioKt2YLhw4hpP95DeAyGua6RnAt/fqwsBnSmGEoqwykfMSnsl0hjkS1
         bsWwfgeS+Cn4bvM0go645Vol+cCCCMRjY/xCdJJPI6BHZmAyVrOoewsqbHTLwY1lGcnO
         kg2T7SHBRpAdz0PFuNf4s28AZ6lLGdKpdet3rg2hLyA9MRZRmSzAVPLev2WjymKdjziN
         azUSWQzywA6A+GWGdnjqoca82VH8O2Bs8nz0opQeMB0qG7DzTs8gZITwB9OdG3kV6l+z
         dgCzdi0vhGIsFjaf1zKDCQshsx6UCY+UuTbvvOP9p6u29iDpBcaiiMnt+wZ1KxV8uzDc
         L5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680596074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0sl7VVFpi43Dv/CruzkWtwl78mBZkfE/sbR0q5Xjw14=;
        b=Z586bMh6Mmf9hbZrVAxaLLAWxLpIvy3yBbBAo0xSo9P2rTfMjvHyJ2+Bk8CPGBs3VK
         gx8K8Afl4HrN5Jp+5dCpH8wD3MyZ9pXTZMUJhDJZuaNykPK9tYcBZQcLa65gLBpEzJMC
         FR1b5L0diC3t6T9d8W+EdTGkeN8+LE/Ezp+ceNPl+JCS6I5fMCkjuouTZVACFjFrImL4
         CV3jJJDx19XZsfMRT490X8KxHwBKp5mpoRpKPHRtqoVbnQm8Jdgn3qpblToNTq+VwXCe
         KqrtIOajICVY1skrGKDfxdaU5ncbZolc9iKJY9OVPEWtIHCvZ8kOa8ve2yjQcwafB2HQ
         v8ug==
X-Gm-Message-State: AAQBX9dNJIfxUn0XvNypYfVSk4cI5RctxyCtuGx72HJa+EchwQoc5dJK
        /xyzsCi6SxAk0vyAWoy2be5YEQ==
X-Google-Smtp-Source: AKy350Z0asUZb5+NZOLgnPMLmWfgC1CrzQ6i1qrDzxsz6ZNtQ0mRJa48QCoVmrU7tlEVVonfzbtOUg==
X-Received: by 2002:a17:906:37cc:b0:947:df9e:4082 with SMTP id o12-20020a17090637cc00b00947df9e4082mr1432939ejc.35.1680596074451;
        Tue, 04 Apr 2023 01:14:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:233a:5c18:b527:381e? ([2a02:810d:15c0:828:233a:5c18:b527:381e])
        by smtp.gmail.com with ESMTPSA id l15-20020a17090612cf00b009222a7192b4sm5579869ejb.30.2023.04.04.01.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 01:14:34 -0700 (PDT)
Message-ID: <0fd972bd-c5e7-65cc-6992-09c4c3e88f95@linaro.org>
Date:   Tue, 4 Apr 2023 10:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] dt-bindings: rtc: add max313xx RTCs
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, a.zummo@towertech.it,
        jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
References: <20230403154342.3108-1-Ibrahim.Tilki@analog.com>
 <20230403154342.3108-3-Ibrahim.Tilki@analog.com>
 <dd6f0842-519f-1bc9-f7f5-459863dc3dcd@linaro.org>
 <202304040710049c9cc01a@mail.local>
 <996b49ab-5e2e-76bc-efb1-38c6384871f6@linaro.org>
 <2023040407444619bf5596@mail.local>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2023040407444619bf5596@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/04/2023 09:44, Alexandre Belloni wrote:
>>
>>> charging will always
>>> enable a diode, select a resistor and then have or not an extra diode.
>>> Figure2 of the MAX31329 datasheet is great.
>>
>> So the diode is in the max313xx? Then why enabling it is a property of
>> DT? Either this should be inferred from compatible or is even a policy,
>> not a DT property. Just because device has a register for something, is
>> not an argument that "something" should be in DT.
> 
> Well, it depends on the battery that is installed on the board so it
> makes sense to have it in DT.

OK, that would be a good reason, but I wonder why? Why choosing diode or
not depends on the battery? Wouldn't you always want to have the diode?

Best regards,
Krzysztof

