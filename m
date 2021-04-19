Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450AF364C9E
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Apr 2021 22:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238567AbhDSUza (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Apr 2021 16:55:30 -0400
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:33774 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230152AbhDSUyD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Apr 2021 16:54:03 -0400
X-Greylist: delayed 1588 seconds by postgrey-1.27 at vger.kernel.org; Mon, 19 Apr 2021 16:54:02 EDT
Received: from pps.filterd (m0118797.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13JKJbqi000579;
        Mon, 19 Apr 2021 16:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : references : in-reply-to : content-type
 : content-transfer-encoding : mime-version; s=pps-02182019;
 bh=uQghDtMmeiO7c0WJMgfZ/0KeSJIyX+F4mdj8tYNaUlI=;
 b=QiAd5uyuD2/WDQDN7/mRnw8Qds4KeU+Z+WL3Bb69L59GEZa7hHo5b7yKLh/EBGHKGs7p
 BvyZzRkmrO18mHmPmDbDyJ/xps3byFCSzmJgqE8aSdS+PfkWlrk36+5E9jkrYRn85oS+
 ocbnDD+V8FIgXVTKGa4uxZtW16TjPJ9bhw02KxVIrnrDt2wX9HPuUZ5RpuXC0MSreKoy
 5qja1cEPUrI4Yx9dlVxlLora6A10r5+cy6AJdksMhIr4i+Tu72GEN7av/YVWcR6HLuEy
 ADS4YhBAWaXUEGYFFWYduqLNM36luGlQ3xMSvZLSo7A0N/FsBVDapIiB6NTxU77SWydP 4w== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
        by mx0b-002ab301.pphosted.com with ESMTP id 3812nd8qcn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Apr 2021 16:26:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6EAztuG1WeGOvjWg+kGqW3dhIYcC18jKHfpqFKHJ01RFeBg7bJHnOdKHCZQZBdbrF0C6mvzk0IkYE6+WERV9x1srh9cggCMpt7hcz8S6U+nTpSu9n+zU+XXONzsMy2aHWi/1maLLbL6H2nAACf6Qc9dB2Tp4UdIXVme7seYk27VeGKWfsAwJUUXrU7yrkLyG7I6uvtMq1TiNUjtR42MOV6VmFC55clHam5Pw6ibiXTQSGO4JhuhbjEQv6J3ZPVmQlH9N36t5GYkI1zwvbvomWW9pstv0ky2wg5dU0q271K7E79p4N4y3i9xh2PiJmAvOUSAT8PyNKvi1WU0as3bwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQghDtMmeiO7c0WJMgfZ/0KeSJIyX+F4mdj8tYNaUlI=;
 b=FB2XWOllu51fKFpSt8pSFyMwe38XMmIM9nOCVTGXtsT1Nu2bpY4Q/EJRXH++cELr2L9wVdp5mAF2cJrtPaXMGY42G6E3d1B/YqAuruBFz/nQ9RTzUn83GIIPKB+l4ygW/TWbga1J0EX9WO0gHHlp3yTFpVAFCZxpCW3KdjJO1aHMExk+hVNZC6YCypU7+B2/2yZOzVErFyVbcXWjaR+i9poJ4ubpLmQLbkNB6qowupYq7HqR/5LZLw/1WmK5mkR5kZnNoU84HrWKCDVHCAu3QsZ0BRDxZaZs4+bwYvtenRFLYoIgYmWgk1SCGxqR7MdGcbZuOaSKsZilF6Kpub/toQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQghDtMmeiO7c0WJMgfZ/0KeSJIyX+F4mdj8tYNaUlI=;
 b=gui0f86SuliZURWuj+sSgPCrv9gqOl3CFLGUxzPKZ/jM9OcaLJ2Y9MUxnZlO0w4QD6vehYehCdj8woD1dFl5enuXr7ryl8s3rZ9iZPRn1a59hBtO6AcTOxRXzs9aSiCesBtHigwuiAvPuZtg75nQ5K30rfpQ5rS8/L1rR7qrhVQ=
Received: from SN6PR01MB4269.prod.exchangelabs.com (2603:10b6:805:ad::23) by
 SN6PR0102MB3549.prod.exchangelabs.com (2603:10b6:805:7::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21; Mon, 19 Apr 2021 20:26:42 +0000
Received: from SN6PR01MB4269.prod.exchangelabs.com
 ([fe80::a960:87f5:c3ed:da0b]) by SN6PR01MB4269.prod.exchangelabs.com
 ([fe80::a960:87f5:c3ed:da0b%5]) with mapi id 15.20.4042.018; Mon, 19 Apr 2021
 20:26:42 +0000
From:   "Gervais, Francois" <FGervais@distech-controls.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Michael McCormick <michael.mccormick@enatel.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] rtc: pcf85063: add integrity check
Thread-Topic: [PATCH 1/1] rtc: pcf85063: add integrity check
Thread-Index: AQHXFp722WysSQ6OikqG5IlMHahVT6q37BqAgAR8yVw=
Date:   Mon, 19 Apr 2021 20:26:42 +0000
Message-ID: <SN6PR01MB4269E7C0A5B2069F96384A6BF3499@SN6PR01MB4269.prod.exchangelabs.com>
References: <20210311174940.23072-1-fgervais@distech-controls.com>,<YHoKQ9qtupDhXVm3@piout.net>
In-Reply-To: <YHoKQ9qtupDhXVm3@piout.net>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=distech-controls.com;
x-originating-ip: [76.67.142.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c677e2d-01b3-4130-5a05-08d9037171cb
x-ms-traffictypediagnostic: SN6PR0102MB3549:
x-microsoft-antispam-prvs: <SN6PR0102MB3549973C0E1A94CCD0F9F3E0F3499@SN6PR0102MB3549.prod.exchangelabs.com>
x-pp-identifier: acuityo365
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cRMU8JwMQ+jDhVbVqLhgiLZq58E4+twM5ojNRiZKWNLcQ8nL4wtxaqhu2cralfaGB8sbnQDXOYrH9omOwW4Nh2Cc9iCzq/taEGCjP760kaP3eCxcb0OFiW1o6cU8RF9Do2Z4SNx8JsSHf/XbH8g2E8jR4/CulNpo1Q+8f2pNFNtIL0dra3VzDZ+FXuMWHvLFo7Ec5N3RLkEI7yDbEbtEyCI/zpB1T2b8kGkdfwgcRm4UURIgJcEqQ4U9hFxUQZFdI7pAXUpNCIXMsck8CwbVsVVs6s1R9h/n8OwyuPxRRl5aI6cOL9HnjrK1r/m62pSI69FRrMlgv2MPNYOKWWZCgdSDMOppq/ztrCkdB18PoBK+YutW7/xWo2flsJ6PgSlVuCXxRBgKF4iTgEaM6x5A01FOFNTUyU27nw85iuZSR9jHkwAppf+XGUBRzaHMwTlWfNcLnLCF3OXzRURIdKAnBT79s+LWXLQzI5FEus5oNegn3MD5OwmpR6iHz4pSBfYeEB14Ct+N5KBRy3jWd51h9o9T4hXDa38IwGRb5VivlTGOyVmiyCmyPRTgX8QLMEhMm6tRd1b8Mtqxl8UBUzE2fuGhQITd5dtB+Bnp4E4DS9c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4269.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(66946007)(7696005)(66556008)(54906003)(55016002)(91956017)(5660300002)(9686003)(66446008)(122000001)(86362001)(38100700002)(83380400001)(26005)(66476007)(64756008)(76116006)(316002)(4326008)(8676002)(6506007)(4744005)(33656002)(2906002)(6916009)(478600001)(186003)(71200400001)(52536014)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?K99pt91Q/60t8t16LIcZDUy55upzUrJxRmaK3VN3wUQbVj9BVVAEmUp1Wu?=
 =?iso-8859-1?Q?gwZWm2GPtrBxiMzAqaKWreWEkoDxIH5mdD1Yz5IULbQbV+qiEIpQdyLnI/?=
 =?iso-8859-1?Q?ds2l4WnKnYYHUH9rFte6w+8RNa9CJhg5QRH39DY1BZPd6mKDEF3UhENj3a?=
 =?iso-8859-1?Q?Im2f4/qxpM5DLTUN/ZzDYiyZZCKCqv6zU3VQIJ4qQghIvTtCAmIHbX5V8q?=
 =?iso-8859-1?Q?+egtTi6CQBZeAPhgd+P1Z/VBigiUbJ0IjUTmYLvEjErd2AqiqI4s2Os6FG?=
 =?iso-8859-1?Q?gemC27oc872/71fCTa8dGIGlpaBfJjtQuhG4fORQOi6R81Q2M4sXHy7mt2?=
 =?iso-8859-1?Q?4JMQ71Aqj/L6W0WOiwnGHQna2GsiHHmGJQK8kac1mMOzR9qQJasfr/+baO?=
 =?iso-8859-1?Q?vJUyzIbF1Y43ulGPFWzbAdpQtJ+HknXgDNFcJkLjHbZ6IGv/TOMbb9xeC2?=
 =?iso-8859-1?Q?Oy9STIyjt2pAuHD5HinB37xPpjRySWIB65Wvt74EMJjHe40eLT9Or8H3OY?=
 =?iso-8859-1?Q?IyEwfsYWif6zqaH5ihG9tRwsDSE40kA9PWHHvxjcQ86ZZlZjDrErhvGYid?=
 =?iso-8859-1?Q?DTmwdDmOboSwWREjI6UfacfV9LgVM6d/534aVrJ8/fhHQakgadMTRbb5E2?=
 =?iso-8859-1?Q?yb+xdFMJd27ITxcosqMOHia8YtMqWii7qJmzfQ44AJMF69juVORmSY4I8r?=
 =?iso-8859-1?Q?m5bWhhVU5EZLQhmHJ5jRE6fVAFJPdum5iD3eB3th17oR0jSzzA+JrCGqGA?=
 =?iso-8859-1?Q?gJYoBe8oo0tqhn/DNdkDR6q3jqCAKiYcNvWllrQU5w9fB41yN1LLlZYzj0?=
 =?iso-8859-1?Q?pM6/UvEfarLFqd+TB7vyxA/wEzYQbP5O6qjOZ6ihMZ95afLNesmzWtnHrS?=
 =?iso-8859-1?Q?4GYaE3vnuBleFkjHWl+jKOjH9JzLFK8l0iV6R5Ia0438IBhDtvMv0B6n5s?=
 =?iso-8859-1?Q?eJ4+MSQIyLhLRaFrCamd39Vo4zj8YbVj2WpOUMZbthNdha+VF6Wb/SJT05?=
 =?iso-8859-1?Q?Q/MpSypfzVoMO1onEmO6YwuXJD4Poy2vToCB5joiYDUM/Fro3XKzyB4F+s?=
 =?iso-8859-1?Q?ZpDyYdE+32sGUw77QJaisl+3GmaqNjLPPRBKkZH8nyd1PWnQT4ZdGGuRpt?=
 =?iso-8859-1?Q?rR99bg0UDEDQmukZF5OyrhkOtiomHHX+ni97gdCmVBKJIIWLjj+OE702Qj?=
 =?iso-8859-1?Q?/B4nsZJlx4IDZQ4Qfa2tt0+cRoJENSDZY0pM2+kC17ETTsDhMED2o5rSDi?=
 =?iso-8859-1?Q?a726mwYFO210OoJ5AY1gU3Pe05ERgOTfQuJvDyoVa03gYhT+iN25hQ0Mev?=
 =?iso-8859-1?Q?S6kAOYWFdcesfUaKOL/7L5iKhF6+PBPH3VQCCRXRqX50GTk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4269.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c677e2d-01b3-4130-5a05-08d9037171cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 20:26:42.3306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NydR/nSPe38E4EQNxMcB6X2KcuBWimrrMwYnsL7PEICimgZhPjQGMPh3od9YPocQJEewXcISnL3FJTcbA5khSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3549
X-Proofpoint-ORIG-GUID: NRs-M3caHoBkS4Ka7Jw0TgEddYSKpP7v
X-Proofpoint-GUID: NRs-M3caHoBkS4Ka7Jw0TgEddYSKpP7v
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104190139
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> I'm not sure I get the use case because PCF85063_REG_CTRL2 should be=0A=
> initialized properly after the driver is probed anyway. The other two=0A=
> can be set from userspace once it detects the oscillator failure which=0A=
> would be better at deciding the policy anyway.=0A=
=0A=
Thank you for the feedback I think I understand now.=0A=
=0A=
We saw the reported problem on devices running kernel v5.4 which doesn't=0A=
have the common clock framework support and so PCF85063_REG_CTRL2=0A=
clkout was not initialized by the kernel and left at hardware default.=0A=
=0A=
I guess with CCF support, if PCF85063_REG_CTRL2 gets corrupted on=0A=
power application, on driver probe the clkout value will be set to 0b000=0A=
or some known default.=0A=
=0A=
I'm not familiar the CCF, do you know if it's the case that default values=
=0A=
will be set on boot?=
