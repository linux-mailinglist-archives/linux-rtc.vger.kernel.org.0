Return-Path: <linux-rtc+bounces-145-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A367DB94E
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Oct 2023 12:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFC95281467
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Oct 2023 11:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD5B14284;
	Mon, 30 Oct 2023 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F414A80;
	Mon, 30 Oct 2023 11:52:40 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FC09D;
	Mon, 30 Oct 2023 04:52:39 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39UBBeBj021732;
	Mon, 30 Oct 2023 07:52:14 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3u1f5hqdeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 07:52:13 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 39UBqCeb000729
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Oct 2023 07:52:12 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 30 Oct 2023 07:52:11 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 30 Oct 2023 07:52:11 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 30 Oct 2023 07:52:11 -0400
Received: from amiclaus-VirtualBox.ad.analog.com (AMICLAUS-L02.ad.analog.com [10.48.65.123])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 39UBpnDt008995;
	Mon, 30 Oct 2023 07:51:51 -0400
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck
	<linux@roeck-us.net>,
        Antoniu Miclaus <antoniu.miclaus@analog.com>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH 0/2] Add support for RTC MAX31335
Date: Mon, 30 Oct 2023 13:50:00 +0200
Message-ID: <20231030115016.97823-1-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: keD7a1S0lVWJ8QczOvikXb-73jf3LJ-d
X-Proofpoint-ORIG-GUID: keD7a1S0lVWJ8QczOvikXb-73jf3LJ-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=992 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310300090

The MAX31335 is an automotive qualified (AEC-Q100) real-time clock (RTC) driven
by an internal temperature compensated microelectromechanical systems (MEMS)
resonator. The oscillator provides a stable and accurate reference clock and
maintains the RTC to within ±2ppm accuracy from -40°C to +85°C, and within ±5ppm
up to +125°C.

NOTE:

Although the datasheet is not public yet, the driver can be made public (on
other linux custon trees it is already).

The driver was tested with actual hardware and works as expected.

Even though the datasheet is not available, if there are any queries about
the functionality of the part, these can be provided/inserted as code comments
inside the driver.

Antoniu Miclaus (2):
  dt-bindings: rtc: max31335: add max31335 bindings
  drivers: rtc: max31335: initial commit

 .../devicetree/bindings/rtc/adi,max31335.yaml |  61 ++
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-max31335.c                    | 759 ++++++++++++++++++
 4 files changed, 832 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/adi,max31335.yaml
 create mode 100644 drivers/rtc/rtc-max31335.c

-- 
2.42.0


