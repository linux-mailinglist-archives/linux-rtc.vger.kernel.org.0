Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824D434E18B
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Mar 2021 08:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhC3Gwf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Mar 2021 02:52:35 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55627 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhC3GwV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Mar 2021 02:52:21 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210330065219euoutp0243634b89b0f641a7f291cb77b1063f8c~xDC93NUuW0223802238euoutp02i;
        Tue, 30 Mar 2021 06:52:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210330065219euoutp0243634b89b0f641a7f291cb77b1063f8c~xDC93NUuW0223802238euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617087139;
        bh=P4hH4Lh8hHpEBNnqQwFeNlXZVuQlqdCL0aNU+24yiK0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZP/10mH2CPXIFCW2Suk/k6IOFrlvLVm7VY4PvqUpMglXmTN0ogUN9hh+RA6vnM2LL
         4f8WbMulQNFFof88XJwnYCSby43wfrz8Q0t/IPnf4kSZSL8cFW/VS1UUDc3zVbnTVF
         jtloeOSmmcMf6HniB7HUhfC3ewNOb5Q/LflZG568=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210330065218eucas1p1feda83f7e06fe8c98432f738dc5e0e5d~xDC9ZjRQo1478814788eucas1p17;
        Tue, 30 Mar 2021 06:52:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F5.BF.09444.2AAC2606; Tue, 30
        Mar 2021 07:52:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210330065217eucas1p2c50a100bf0101e72dd753f37257f6a57~xDC8sxecC0045700457eucas1p2D;
        Tue, 30 Mar 2021 06:52:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210330065217eusmtrp1001c32a5dbba642f5d558b498ab286e1~xDC8sE3Ld1277212772eusmtrp1F;
        Tue, 30 Mar 2021 06:52:17 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-d7-6062caa26231
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FF.4B.08705.1AAC2606; Tue, 30
        Mar 2021 07:52:17 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210330065217eusmtip253736d518f78c13e59901495e526f3e2~xDC8ePs1q1721017210eusmtip27;
        Tue, 30 Mar 2021 06:52:17 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: ds1307: set uie_unsupported if no interrupt is
 available
Date:   Tue, 30 Mar 2021 08:52:08 +0200
In-Reply-To: <YGJqfVFVb7Z1LBTu@piout.net> (Alexandre Belloni's message of
        "Tue, 30 Mar 2021 02:02:05 +0200")
Message-ID: <dleftj8s65gmlj.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djP87qLTiUlGMx8p2Kx5OJVdov2d8vY
        LTbOWM9qcXnXHDaLY6uvsFmsPXKX3YHNY96aao++LasYPabP+8nk8XmTXABLFJdNSmpOZllq
        kb5dAlfGpYtXWAvaRCu+Hb3F0sB4R7CLkZNDQsBEYv6s1yxdjFwcQgIrGCXW3/nABOF8YZSY
        cH89G0iVkMBnRokVDdUwHc+6prBCFC1nlLjx6BE7hPOcUeLoiYdAHRwcbAJ6EmvXRoA0iAiY
        SrQ27mIDqWEWeMwocef4CkaQhLBAiETvh8OsIDaLgKrE96UP2UFsToE8icvXPjKB2LwC5hJn
        p7WBXSEqYCmx5cV9doi4oMTJmU9YQGxmgVyJmeffMIIskBB4wSHRNGsPM8SpLhJHvnQxQdjC
        Eq+Ob2GHsGUkTk/uYQE5VEKgXmLyJDOI3h5GiW1zfrBA1FhL3Dn3iw3CdpSYuvkAG0Q9n8SN
        t4IQe/kkJm2bzgwR5pXoaBOCqFaRWNe/B2qKlETvK4h3JQQ8JPqXTmeBBGiNxLqzfewTGBVm
        IflmFpJvZgFNZRbQlFi/Sx8irC2xbOFrZgjbVmLduvcsCxhZVzGKp5YW56anFhvlpZbrFSfm
        Fpfmpesl5+duYgQmodP/jn/Zwbj81Ue9Q4xMHIyHGFWAmh9tWH2BUYolLz8vVUmEV/hAYoIQ
        b0piZVVqUX58UWlOavEhRmkOFiVx3qQta+KFBNITS1KzU1MLUotgskwcnFINTELGWgf5bne+
        01rvcMXp3p5Gbf22aQKqFT/mrjrE3e76Q7vjW3WvsZ5wXprBUseE99Nc8lKklpxmr6rs+VLr
        P9n6yLq6X1Zb5lbP+aiSpHdebdrshYwMV9bksP+UMnlrn5G/JjRwbnbh7Z+fBIKbGx8v2vf/
        +uHP+oc0pplEvjBl4RfRK2tymLQr68Kug9sPeCVeXXUwf09GaOzUf/33BCK+8Vzk2SBZF578
        df8uxp1MK0R2WMyO2zPzRF9Zc/xP34tr99pVmfy6qPHT67zzzdMS+x4Gnt/xRdsm4OrxvNsS
        hysnxrY8qxDvfnFwVZuvkcPd1JlTRaXuGsx4MSNsvmJv1W23Va0GnJ/eeNgrXVViKc5INNRi
        LipOBADZCYC9vQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xe7oLTyUlGMxtNbZYcvEqu0X7u2Xs
        FhtnrGe1uLxrDpvFsdVX2CzWHrnL7sDmMW9NtUffllWMHtPn/WTy+LxJLoAlSs+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j0sUrrAVtohXfjt5i
        aWC8I9jFyMkhIWAi8axrCmsXIxeHkMBSRonnd58ydzFyACWkJFbOTYeoEZb4c62LDaLmKaPE
        jcUr2UFq2AT0JNaujQCpEREwlWht3AVWwyzwnFHi7bt+VpCEsECQxNb3S5hBbCEBDYnNO06w
        g9gsAqoS35c+BLM5BfIkLl/7yARi8wqYS5yd1sYGYosKWEpseXGfHSIuKHFy5hMWEJtZIFvi
        6+rnzBMYBWYhSc1CkpoFdB6zgKbE+l36EGFtiWULXzND2LYS69a9Z1nAyLqKUSS1tDg3PbfY
        UK84Mbe4NC9dLzk/dxMjMIa2Hfu5eQfjvFcf9Q4xMnEwHmJUAep8tGH1BUYplrz8vFQlEV7h
        A4kJQrwpiZVVqUX58UWlOanFhxhNgV6byCwlmpwPjO68knhDMwNTQxMzSwNTSzNjJXHerXPX
        xAsJpCeWpGanphakFsH0MXFwSjUwGTbdOSjT/eRBF+/7STovZy2Qa5GdUCbkvDM+Kizmiq5n
        +7vHZ/lPT0pTsec17Da4WS22THphRPWB43q1s9nXHU74dfkCX/uW9Q5eQluObylmP+SnufBs
        U+WaE33MXrEzdG8HOH2yWj3vgf8crck6LwT7rYOcDLP2Xr0vq8+wpOFmPhdHUfzm864dj5gT
        /M5q1rLNt+tcu+TrhWax/CpVi9WL9ZdIJrq+82b573nY+dTew8El51rmel1aemXvV8+1RS7u
        Ye595x15fVRXTzjy7nWXwoIzk2RKfff8KIzQmMPKdUzJqapW/4PHGV5PbvbCzfFFitcPGXot
        zvzAGP/DrLyMPalT3VcsNuaRdpASS3FGoqEWc1FxIgAXq2kMNgMAAA==
X-CMS-MailID: 20210330065217eucas1p2c50a100bf0101e72dd753f37257f6a57
X-Msg-Generator: CA
X-RootMTR: 20210330065217eucas1p2c50a100bf0101e72dd753f37257f6a57
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330065217eucas1p2c50a100bf0101e72dd753f37257f6a57
References: <YGJqfVFVb7Z1LBTu@piout.net>
        <CGME20210330065217eucas1p2c50a100bf0101e72dd753f37257f6a57@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-03-30 wto 02:02>, when Alexandre Belloni wrote:
> On 16/03/2021 19:04:14+0100, Lukasz Stelmach wrote:
>> OK, you are right. The problem seems to be elsewhere.
>>=20
>> How about this scnario? We call rtc_update_irq_enable(). We read rtc
>> with __rtc_read_time() and calculate the alarm time. We get through
>> rtc_timer_enqueue() and down to __rtc_set_alarm(). We loose the race
>> condition (I can do it, I've got really slow connection to DS3231) and
>> we return -ETIME from __rtc_set_alarm()
>>=20
>>     if (scheduled <=3D now)
>>         return -ETIME;
>>=20
>> and 0 from rtc_timer_enqueue() and the very same zero from
>> rtc_update_irq_enable(). The caller of ioctl() thinks they can expect
>> interrupts when, in fact, they won't receive any.
>>=20
>> The really weird stuff happens in rtc_timer_do_work(). For the timer to
>> be dequeued __rtc_set_alarm() needs to return EINVAL three times in a
>> row. In my setup this doesn't happen and the code keeps running loops
>> around "reporogram" and "again" labels.
>>=20
>> With my patch we never risk the above race condition between
>> __rtc_read_time() in rtc_update_irq_enable() and the one in
>> __rtc_set_alarm(), because we know rtc doesn't support alarms before we
>> start the race. In fact there is another race between __rtc_read_time()
>> and actually setting the alarm in the chip.
>>=20
>> IMHO the solution is to introduce RTC_HAS_ALARM flag for struct
>> rtc_device and check it at the very beginning of __rtc_set_alarm() the
>> same way it is being done in ds1337_set_alarm(). What are your thoughts?
>>=20
>
> I did introduce RTC_FEATURE_ALARM for that in v5.12. I'm sending patches
> that are not well tested but should solve your issue.

Oh, I didn't see that one coming (-; I was working on a slightly larger
feature elsewhere in the tree and didn't rebase too often. I will test
the patches.

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmBiypgACgkQsK4enJil
gBDwvggAil1Ff0dCZuWdYkRAm05OuqXUM9ki+5t+wJOpnNeL+ukrHagoKTMQt7um
LiqYV+QLk+4YMkgdQ0NrIFTOoXBk4k0Vbj333/vTEk30RK1qVLTHAkN4mHi2v1LW
Te/5h64p3U+DZWDkmniLWNmhJqjoXpohytmbBo5BDQ75+ZttkaN2KZHqdIDSxs41
RpWMNDn3qnpv0xUggUoTkh0gwljToLPPpyFOAg9GZZALRBkCmMqipnzDUKNlk8ir
mulX0PFjptdgVBknElxtrbdvqrO0zSAv+zwEAOAz4G3Apn2RCpfDv/kaRO1g1hlA
OuA1u86B92uhNjhycumYhPiB3RPH6g==
=5P0R
-----END PGP SIGNATURE-----
--=-=-=--
