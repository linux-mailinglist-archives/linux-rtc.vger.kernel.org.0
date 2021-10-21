Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067064367C2
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Oct 2021 18:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhJUQbT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Oct 2021 12:31:19 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:52490 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231788AbhJUQbT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Oct 2021 12:31:19 -0400
Received: from [77.244.183.192] (port=65154 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mdaw9-000ZT9-2O; Thu, 21 Oct 2021 18:29:01 +0200
Subject: Re: [PATCH v2 7/9] watchdog: Kconfig: fix help text indentation
To:     Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
 <20211019145919.7327-8-luca@lucaceresoli.net>
 <62fb371c-81d3-a338-624b-0e3fbade23db@roeck-us.net>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <8129ae8a-0978-426f-649d-feab1292e15d@lucaceresoli.net>
Date:   Thu, 21 Oct 2021 18:28:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <62fb371c-81d3-a338-624b-0e3fbade23db@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Guenter,

On 19/10/21 17:06, Guenter Roeck wrote:
> On 10/19/21 7:59 AM, Luca Ceresoli wrote:
>> Some entries indent their help text with 1 tab + 1 space or 1 tab only
>> instead of 1 tab + 2 spaces. Add the missing spaces.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> FWIW, this patch should probably be handled separately, not as part
> of this series.

That was the initial idea. But this patch patch and patch 8 touch nearby
lines, so adding the patch to this series looked like a good idea to
avoid wasting maintainer time. It looks like I got the opposite effect... :(

> Anyway,
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks.

-- 
Luca
