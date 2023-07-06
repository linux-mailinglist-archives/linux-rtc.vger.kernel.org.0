Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12AA074956D
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Jul 2023 08:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbjGFGOy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 6 Jul 2023 02:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbjGFGOx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 Jul 2023 02:14:53 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558B71737
        for <linux-rtc@vger.kernel.org>; Wed,  5 Jul 2023 23:14:52 -0700 (PDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3665qNr3014103;
        Thu, 6 Jul 2023 06:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=X8sXLsSHxfg1iIQFuf+SYkXBpsfA44R6YEJxrviC1Vw=;
 b=ssE2a4aJuprbBLkMlI8re2l34UQ8WwO55tULMkkcTzK6lxO84+I7VfU9soG8bmOlbuXX
 YNeI//paLWmYZt5MNybSgthlkf3n5ctFGp7+zgFjs3+ypF/tAxk6QVja40d0C6msTl49
 4ycS9BSwwZvMlM4N2hyYN6t3kKfqdjJ9ANBQ2r2pHw0Mju079rGl7YyY2t7PuX+QoTK6
 7bEIGJzacGosF/rN3un0N3xdBLxWPR6ZkhgoSKHmgVYmnlZx4ARQ1oGHXYaiaJH9xefF
 qUMv+0Gle2+234pwCBAsdyKi6Y0hxZLg0bYyM2U02SO3sFSCBPIKP3gjKqsZfrmTdejo 2A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnqudgkyk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jul 2023 06:14:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3664e8lI009912;
        Thu, 6 Jul 2023 06:14:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
        by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rjbs4u5x3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jul 2023 06:14:36 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
        by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3666EX0X45679226
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 6 Jul 2023 06:14:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B038720049;
        Thu,  6 Jul 2023 06:14:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 36B1220040;
        Thu,  6 Jul 2023 06:14:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Thu,  6 Jul 2023 06:14:33 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 00D4960142;
        Thu,  6 Jul 2023 16:14:29 +1000 (AEST)
Message-ID: <06d642f1e1245df1c68b6bd5fbd288233be027bc.camel@linux.ibm.com>
Subject: Re: [PATCH] rtc: Kconfig: select REGMAP for RTC_DRV_DS1307
From:   Benjamin Gray <bgray@linux.ibm.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Joel Stanley <joel@jms.id.au>
Date:   Thu, 06 Jul 2023 16:14:28 +1000
In-Reply-To: <4e94cb11-1f39-d631-fe0a-b945b301b77c@csgroup.eu>
References: <20230705003024.1486757-1-bgray@linux.ibm.com>
         <4e94cb11-1f39-d631-fe0a-b945b301b77c@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P4GMUuuqTGgiz0Zic8uX8SfIZPI5tUah
X-Proofpoint-ORIG-GUID: P4GMUuuqTGgiz0Zic8uX8SfIZPI5tUah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_02,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1011 malwarescore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060052
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 2023-07-06 at 05:13 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 05/07/2023 =C3=A0 02:30, Benjamin Gray a =C3=A9crit=C2=A0:
> > The drivers/rtc/rtc-ds1307.c driver has a direct dependency on
> > struct regmap_config, which is guarded behind CONFIG_REGMAP.
> >=20
> > Commit 70a640c0efa7 ("regmap: REGMAP_KUNIT should not select
> > REGMAP")
> > exposed this by disabling the default pick unless KUNIT_ALL_TESTS
> > is
> > set, causing the ppc64be allnoconfig build to fail.
> >=20
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > ---
> > =C2=A0 drivers/rtc/Kconfig | 1 +
> > =C2=A0 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index ffca9a8bb878..7455ebd189fe 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -246,6 +246,7 @@ config RTC_DRV_AS3722
> > =C2=A0=20
> > =C2=A0 config RTC_DRV_DS1307
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "Dallas/Maxim =
DS1307/37/38/39/40/41, ST M41T00,
> > EPSON RX-8025, ISL12057"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select REGMAP
>=20
> As far as I can see, REGMAP defaults to Y when REGMAP_I2C is
> selected.
> Can you explain more in details why you have to select it explicitely
> ?=20
> If there is something wrong with the logic, then the logic should be=20
> fixed instead of just adding a selection of REGMAP for that
> particular=20
> RTC_DRV_DS1307. Because others like RTC_DRV_ABB5ZES3 or
> RTC_DRV_ABEOZ9=20
> might have the exact same problem.

Right, yeah, I don't want to assert this patch is the correct solution,
sending it was more to offer a fix and=C2=A0allow discussion if it should b=
e
resolved some other way (so thanks for replying, I appreciate it).

In terms of why I made this patch, the way I see it, if a config option
requires another config option be set, then "selects" is the natural
way of phrasing this dependency. "default" on the REGMAP side seems
weird. If it's a default, does that mean it can be overridden? But
RTC_DRV_DS1307 *requires* REGMAP; it's not just a "would be nice". The
build breaks without it.

But maybe KConfig works differently to my assumptions. Maybe the
referenced patch that causes the build failure is actually incorrect
(CC Geert). I spoke with Joel Stanley (CC) and he indicated you're not
supposed to depend on REGMAP like KUnit does?

As for other drivers having the same problem, quite possibly, yes. But
the PPC configs don't seem to build those drivers, so I'd prefer to
leave it to anyone who does build them to report the error. I wasn't
planning to audit all the drivers, I was just trying to fix the PPC
configs I build and test.
