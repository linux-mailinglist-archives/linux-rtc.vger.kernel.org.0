Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C4D2CBD8C
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Dec 2020 13:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbgLBMzb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Dec 2020 07:55:31 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51445 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbgLBMzb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Dec 2020 07:55:31 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201202125438euoutp0261e3768489d6b6dba63a00de1f07fdea~M53obT4bP1158811588euoutp02R
        for <linux-rtc@vger.kernel.org>; Wed,  2 Dec 2020 12:54:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201202125438euoutp0261e3768489d6b6dba63a00de1f07fdea~M53obT4bP1158811588euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606913678;
        bh=xqdzMRyQS41Gs5dc7KXkqPZX/n6WE+EgamJE/ZxR9c0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=XEir6yiDT2Qv7LW/LvdjWJ8OENj0yAIF82gcwh5/tisKzaksPfoxCdQJTD27KiiIc
         N1VOn7crIeDxYFqUwrYtntFDt1mUwjVlrKPZS3is9Fu/zfsMFzMI355LBM20cG3c3U
         vgTPx4waBUVavBLvpEII4NVhOP8+IO4XR0eRWnl0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201202125433eucas1p11471b532ec6b529f071a2f4231b9c526~M53jhLWS71652716527eucas1p1C;
        Wed,  2 Dec 2020 12:54:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 52.85.44805.98E87CF5; Wed,  2
        Dec 2020 12:54:33 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201202125432eucas1p22dce8205bf718344079df1fb2610a1f2~M53jDNfD90643606436eucas1p2T;
        Wed,  2 Dec 2020 12:54:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201202125432eusmtrp2fac11f34ff95d01d3186a88e7ca4e6b3~M53jCQCPI2489124891eusmtrp29;
        Wed,  2 Dec 2020 12:54:32 +0000 (GMT)
X-AuditID: cbfec7f4-b4fff7000000af05-36-5fc78e89dd1e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 3B.1C.16282.88E87CF5; Wed,  2
        Dec 2020 12:54:32 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201202125432eusmtip29163baa7973b97d3b15df285582e142d~M53ilWGMz2664526645eusmtip2K;
        Wed,  2 Dec 2020 12:54:32 +0000 (GMT)
Subject: Re: [PATCH 2/2] rtc: s3c: Remove dead code related to periodic tick
 handling
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <6f29a418-6a96-4b4b-c2c4-3722f3ad9895@samsung.com>
Date:   Wed, 2 Dec 2020 13:54:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201202124904.GB36340@kozik-lap>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djP87qdfcfjDb5uErJYcvEqu0X7u2Xs
        FhtnrGe1OH9+A7vFsdVX2CxmnN/H5MDmMW9NtcemVZ1sHn1bVjF6TJ/3k8nj8ya5ANYoLpuU
        1JzMstQifbsErownP48wFfSxVzy7NJWlgfEJaxcjB4eEgIlEw670LkYuDiGBFYwSt09vYIJw
        vjBKzJu9nBXC+cwocerue7YuRk6wjvaTW9ggEssZJVY1b2aEcN4zSjxb95cVpEpYIFyi+94P
        MFtEQFPi+t/vYKOYBa4xSkztuMIEkmATMJToetsFNpZXwE7i+eXJYHEWARWJJQuOgtmiAkkS
        Bz8+gKoRlDg58wkLiM0poC8x+eJ8MJtZQF5i+9s5zBC2uMStJ/PBnpAQuMAh8WJJIzPE3S4S
        rT/boWxhiVfHt7BD2DIS/3fCNDQzSjw8t5YdwulhlLjcNIMRospa4s65X2ygMGMG+mf9Ln2I
        sKPEyX/r2SFBySdx460gxBF8EpO2TWeGCPNKdLQJQVSrScw6vg5u7cELl5gnMCrNQvLaLCTv
        zELyziyEvQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEpp7T/45/2cG4/NVHvUOM
        TByMhxglOJiVRHhZ/h2JF+JNSaysSi3Kjy8qzUktPsQozcGiJM6btGVNvJBAemJJanZqakFq
        EUyWiYNTqoFJ4u4SrgVapeGLwhS7Qz2Vay8wmU2aYNtjZfWqm2d/nbeWX1Ntf+X3s6sf1j74
        bRA51bZW7f0St7nuS090Ol7xa7cI22zFtfAiX9ik80dDHL7MX17ZddHh1vS77d1LOtZI/Do9
        bbd6wqMm47BATsGYqSlP9Nc5aT+v6fvW67f5svOEZhVFs5nPtxhlJk+sWn1nUUjsUdfTUnvf
        37p+bX3ou5OSNfrZiVt12Q9p/wr9eabd6dYWJtsUAb9pBibvLxV8vfDhZ6OI06FlHty1vPo3
        66ZMvFp94MqvKm9+tT9RbxZx3bI5d0hwBbvjmaeh0Q7bmGvZLeq0Z+pH/t+vdSvVot9n/6bl
        YbZT/wvurLqlxFKckWioxVxUnAgAkyLBQawDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xe7odfcfjDR41GlksuXiV3aL93TJ2
        i40z1rNanD+/gd3i2OorbBYzzu9jcmDzmLem2mPTqk42j74tqxg9ps/7yeTxeZNcAGuUnk1R
        fmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaTn0eYCvrY
        K55dmsrSwPiEtYuRk0NCwESi/eQWti5GLg4hgaWMEj139zBDJGQkTk5rgCoSlvhzrQuq6C2j
        xNRpW5hAEsIC4RLd936AFYkIaEpc//udFaSIWeAGo8Tq41+gOl4wSsxcMRNsLJuAoUTXW5BR
        nBy8AnYSzy9PBpvEIqAisWTBUTBbVCBJ4vfStVA1ghInZz5hAbE5BfQlJl+cD2YzC5hJzNv8
        kBnClpfY/nYOlC0ucevJfKYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfm
        pesl5+duYgRG27ZjP7fsYFz56qPeIUYmDsZDjBIczEoivCz/jsQL8aYkVlalFuXHF5XmpBYf
        YjQF+mcis5Rocj4w3vNK4g3NDEwNTcwsDUwtzYyVxHlNjqyJFxJITyxJzU5NLUgtgulj4uCU
        amCK7V+mVi3stnAKY8q+/Us/917/yJ/J8FLHVkgmP/jCa+tZtVsm/Dcrviuj9W/Jl7Y7vGbC
        AZ+Wmf3e69E9oz23cM65iRPfa+1T6NY7NG3Osu2PbJbn+s88dKPPWOqT67GYsrf2V4t+LRY/
        Ms3Xo/29T0q0wIflxVVqnO0i/H06MQJe70pfTF4+t0FUW7FA5HsX47ZCScsFU99cjZqySHQy
        q6+xxG2uDfGLNNf8DC7P+vV2VeiqjilLOM/ol0gZzWg/zbU9uvHdz0VzNooXZU9WWLZ0L5/H
        8kPW6yIX3dH+IXvR9+gEfVnb9Tf+Ke40t58Sek5D/Jim4xL+VyKOlz/kRlYpKfJz+25ffk5A
        4ki5EktxRqKhFnNRcSIAi0sguT8DAAA=
X-CMS-MailID: 20201202125432eucas1p22dce8205bf718344079df1fb2610a1f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1
References: <20201202111318.5353-1-m.szyprowski@samsung.com>
        <CGME20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1@eucas1p1.samsung.com>
        <20201202111318.5353-2-m.szyprowski@samsung.com>
        <20201202124904.GB36340@kozik-lap>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Krzysztof,

On 02.12.2020 13:49, Krzysztof Kozlowski wrote:
> On Wed, Dec 02, 2020 at 12:13:18PM +0100, Marek Szyprowski wrote:
>> Support for periodic tick interrupts has been moved from the RTC class to
>> the HR-timers long time ago. Then it has been removed from this driver by
>> commits 80d4bb515b78 ("RTC: Cleanup rtc_class_ops->irq_set_state") and
>> 696160fec162 ("RTC: Cleanup rtc_class_ops->irq_set_freq()"). They however
>> did not remove all the code related to the tick handling. Do it now then.
>>
> Update also the bindings (one IRQ less), please.
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Well, in theory bindings describe the hardware not the drivers. Hardware 
is still capable of triggering the periodic tick interrupt. It is just a 
Linux kernel policy not to use it at all...

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

