Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02731387456
	for <lists+linux-rtc@lfdr.de>; Tue, 18 May 2021 10:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346818AbhERIsI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 18 May 2021 04:48:08 -0400
Received: from mail-eopbgr70048.outbound.protection.outlook.com ([40.107.7.48]:42518
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241591AbhERIsI (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 18 May 2021 04:48:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZHYIAjHXOjZaSoD9YhhZYKkacMHCRq1OqzU+s+IOJXJND9J8xfSzy3eyJfrPUk0T6RB8vO3/GLh3a8dclGGFCZqKBMG8crImkRRyjp1iNKrUlq336YTjf2o3eT+ULHbC+vvYBQbQyL0g4FKEajUFYDXjciTZBsNUOxsZTmAhg7OGUkWfTef8hwW7rnWMAs/1K4VKf4qUVHPwgxNQ3d2FidWeOpqktE+/UDtZG63TcMiUjescW03AG7kPDpCa9ylj1CCKCxGXzw7k0G7Kb/o3NnOg/1sziCq5Vm1DKKdY7tdFi5AlAPtw3p7o1lFvQ07U/VjTfT0mj//N1GQaV2GyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/yK4/wbqqmfoIAv5hm6qfvQqG0Ij2DOXgZvF5A9Ia8=;
 b=QyQ9NcQtPHKiA4UjHYLyCml/Xd7C/pyRMJ1mZ8kuEHlp+S4jrYvbky8yXYJekuxUL6dYm4UQ9V2dxrp6iVkzz5XESDcJI8J1PwKyDbqE5QmEoKdl+DKu5ferm7ZEfdu8uFsbmQjiTzKHRBozA+z9Y/oS8UyHm51b8WwMB6MwbXVFXye1AYTVIlDbwXmQ3ewIS7cWfWhYXsvno3vTXsEKFysFQ3eF+lXpdo2TNRk+SNe6WlCZiN6glrz8Dz/x3152vhjWlXuSlfBKHhWxK6jsub5+V6QtadS21B7EV6yiqnzgjrNbEWacrhVY5fgzxJN+qdBABIkM0Sa6LcI1/SHfJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatecgmbh.onmicrosoft.com; s=selector1-abatecgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/yK4/wbqqmfoIAv5hm6qfvQqG0Ij2DOXgZvF5A9Ia8=;
 b=JHpXMBhJyNh2FsnTJmryia0PwSgdeJeFNVh0McAepnOIoJqWcPi0rG8AGE+7Vtj1RB/IC8dAAWUs3dv+ww850C14mKqMi5qpoaq412pseWi8w8cIGiVMkbci4nypCgPilPiqDY7Q0D5JPMQ+iPZbVxvN/p6NmkXE4DhKpQ3vbXc=
Received: from AM8P190MB0980.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1da::20)
 by AM0P190MB0659.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:198::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 08:46:48 +0000
Received: from AM8P190MB0980.EURP190.PROD.OUTLOOK.COM
 ([fe80::444f:65f2:44f6:c167]) by AM8P190MB0980.EURP190.PROD.OUTLOOK.COM
 ([fe80::444f:65f2:44f6:c167%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 08:46:48 +0000
From:   Hager Stefan <s.hager@abatec.at>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: [RFC] rtc: rv3032: Add devicetree parameter to enable level switching
 mode
Thread-Topic: [RFC] rtc: rv3032: Add devicetree parameter to enable level
 switching mode
Thread-Index: AQHXS8CTwlnOHia4tkuybUHKgqxraQ==
Date:   Tue, 18 May 2021 08:46:48 +0000
Message-ID: <AM8P190MB09806335DF5E7967BB8EA9E4F52C9@AM8P190MB0980.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-AT, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=abatec.at;
x-originating-ip: [85.31.7.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 722c8b75-8538-4bb2-b33e-08d919d9795a
x-ms-traffictypediagnostic: AM0P190MB0659:
x-microsoft-antispam-prvs: <AM0P190MB0659CE9EBBC672B05A58040EF52C9@AM0P190MB0659.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PcL4lAAUbbfYyCjfd2TiuC4miP/6bfrp1oPS7Ru91rEnXo8NAWdii+EQuweJ0VH58KgEDxlXGBC47qgb4Ql4gqNzDKhawDJen9dll37jEFgTo9XYi1OAR9c1ejdTRIKh1kGkQPPiYsiIMBufxIQFb18tcv2g5PRp6Nl9YbFOHAEqpsnj/Z99nWYDT3nEdk0C2wP5cS/rgvqyhJf4gu9HT9CjJXwKwHSdsqkU4ffW80g5XJI4SRsXS+gdPtTl8nxSNAwUG8Rvp7l5FJEMfTke772wOfR3UIFUyMYr1/zQrNMZQp4wqY1kjmz1QbJLtuwBqM4Mr3PI9v7lyVRD9BcWLs6FXQKbhh2pSin0C+TtQtQkR7IbUooYSkdXQZHDaUxRd39ZMF1k2W7vW9fldmxdBRdmOWmS8yJhOjO/FCNkU5UvGCVp4z0scjzaBPGi55nWRuxQtCs6F3soEsLZGhpRRVsCQv7ptefUzilGkyWkHb/ynZIHhIm6FmcTrCis9DXRmSFZVDgXmjcjNUQEm+9HWnUxAr2/sFyWGdvNEmOyu+oC8cf/2NRI4KuuNBKBoXGA3FhFBYw9go7zLO2kvBPyGhECHWR3YRRQsBSpHmJU7+E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P190MB0980.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39840400004)(366004)(376002)(7696005)(83380400001)(52536014)(186003)(38100700002)(478600001)(2906002)(9686003)(71200400001)(122000001)(86362001)(316002)(8936002)(33656002)(26005)(110136005)(76116006)(55016002)(66946007)(5660300002)(66446008)(66556008)(4326008)(8676002)(66476007)(64756008)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?S+dkb3n51WKl+wfY7zx3LNL5mrN/vsTyJFFK43h+bmCMFcrSccL/Hmk/R5zH?=
 =?us-ascii?Q?OsRCv+30qdDsHf4lv9YrPIyGY7fEA9rl6e+VNJ4BQkE9AFsuJwlbELGtXloq?=
 =?us-ascii?Q?UT9L0XcQuwOQdCjQtbHDc6FH2fwt58FLJatXj0dzY/Dr6Qg6fdSU3bbfKlfa?=
 =?us-ascii?Q?mIypfCA4MMq5RFx03+BTmvZHRF4p+zcF28vt6xnVurZT6DsxtdqitXhJDgHH?=
 =?us-ascii?Q?gb4V/eujeFpD3gW+bcgZDfP/8VKqRkiQIaD5eO1+ecqPvFrxPwv+PM7cq7xL?=
 =?us-ascii?Q?RsmNNbSxHonVmjHCPXo42f4qqI2eGjCnf9GmCmfbUfa4zonxcDBPYJzeHfl0?=
 =?us-ascii?Q?MKc3BhW9j/i3pELxp88Mr3k6N4VWSeeopB4cNsy9nro3ABlnhkm4E6gSkSaZ?=
 =?us-ascii?Q?qa6bZJG0vd4f/zPqQ0NDU/YW8wRZ7KyJd550SAoNGAplWeo7X6STP3ljsYn6?=
 =?us-ascii?Q?DM7am5MdYPWJE4Kqf5xvsdDoMry+ffDooOvxbOQ106zsz7GSCKOwHk60u4ZD?=
 =?us-ascii?Q?6bLeM5jKwx7KecPfNy13tzNErWGC2QkPlL1YwrWrU1DcFV0qlqkcJ3TK/8Sg?=
 =?us-ascii?Q?/LZJUf4c3zuCjDqRgoeeBrYggJ01v6uqjUCXUxOoPCis5fVWPdFZ3HjBgXc7?=
 =?us-ascii?Q?0Kf3ASfxP2DY/MGIMc2Fji+MOM/l0bZ1rnV5XDJzKZHbZI0T6XOweMyrOk1J?=
 =?us-ascii?Q?rvL8W6mqRn73874HjfwddzfSJkeoNEjfVNKTW6LCeZpJhka2CYmFyBiI0a9X?=
 =?us-ascii?Q?BT1nNBdJ1R4hNNQ+oSnlebgSobPSTkoZSP2nhTXHKZ7c0XQj5eWNUx0bKl/m?=
 =?us-ascii?Q?nag/Ybf0b+sOi/vwYv+0IBCeJeP5F313EqGIzHvE4HDYpUgk1jun80SJ+KPi?=
 =?us-ascii?Q?2trbqRgTzxUmHXhZTLD18BWeMZRT7IT0rC0Nbsb1qWJAkSKAGo/Mq3pXekUI?=
 =?us-ascii?Q?kuo/wSZVVrL9Kf6OhO3C3F2LHJhocDV04sRYdUbtZ/uc02LjFKSiG9z0yEci?=
 =?us-ascii?Q?nI5ggvruV7AVLwUEcAl1g6p0jiTI8YelxPNIipzbBLTcY2vFV+RzCyIE9nxm?=
 =?us-ascii?Q?/DG/b/4zQoA5QLc3481x5K6aVCl3H081S6q6+wwxd/147piiY72dOWH8GnOm?=
 =?us-ascii?Q?tNe07fsZ9Fjn36qpXMgnI+iW8sjnYztIU/BanXO0QMrtXOWWpQCBKH+3F4AN?=
 =?us-ascii?Q?SAB3Ms4QBggXzLq3tJe3QhcPRQMlwzCeca7eOZCoyBWGA9fXJsyix41u7C+h?=
 =?us-ascii?Q?ZWnksrQQqFb69zn6AX9Y/BtlgzqTjvyqBDd+ejZ2SQSMKPywZ4LAYvPUKcv5?=
 =?us-ascii?Q?YnE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8P190MB0980.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 722c8b75-8538-4bb2-b33e-08d919d9795a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 08:46:48.3324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWoONy4rXjEKLGymX8snqkKvsHeEyylJDtnVHH9kGMJgZuaMj1fqLdz5LXaDt2K3PTeacWkO97dkFCLuVRWANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0659
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When the Micro Crystal RV3032 rtc is used with a primary coin-cell for powe=
r backup, the backup switching mode LSM (level switching mode) should be us=
ed according to the technical support from the manufacturer of this device.=
=0A=
=0A=
Currently there is no way to set this mode by the driver.=0A=
=0A=
Thererfore, i suggest to introduce an additional parameter for the devicetr=
ee to enable this backup switchover mode=0A=
and to extend the probe function to look for that parameter and activate th=
e LSM.=0A=
=0A=
Is this an appropriate solution? Does it need improvements?=0A=
=0A=
Signed-off-by: Stefan Hager <s.hager@abatec.at>=0A=
=0A=
---=0A=
diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml=
 b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml=0A=
index a2c55303810d..b948e19e358b 100644=0A=
--- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml=0A=
+++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml=0A=
@@ -37,6 +37,10 @@ properties:=0A=
       - 3000=0A=
       - 4400=0A=
 =0A=
+  backup-switchover-mode-level:=0A=
+    description:=0A=
+      Use level switching mode for backup switchover mode=0A=
+=0A=
 required:=0A=
   - compatible=0A=
   - reg=0A=
diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c=0A=
index d63102d5cb1e..a28a3e0172d0 100644=0A=
--- a/drivers/rtc/rtc-rv3032.c=0A=
+++ b/drivers/rtc/rtc-rv3032.c=0A=
@@ -881,6 +881,12 @@ static int rv3032_probe(struct i2c_client *client)=0A=
        if (ret)=0A=
                return ret;=0A=
 =0A=
+       if (device_property_read_bool(&client->dev, "backup-switchover-mode=
-level")) {=0A=
+               ret =3D regmap_update_bits(rv3032->regmap, RV3032_PMU, RV30=
32_PMU_BSM, (RV3032_PMU_BSM_LSM) << 4);=0A=
+               if (ret)=0A=
+                       return ret;=0A=
+       }=0A=
+=0A=
        rv3032_trickle_charger_setup(&client->dev, rv3032);=0A=
 =0A=
        rv3032->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;=0A=
=0A=
